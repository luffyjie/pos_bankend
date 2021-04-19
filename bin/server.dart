import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;

const _hostname = '192.168.0.113';
const _port = 8080;

void main(List<String> args) async {
  /// Cascades handles
  final handlerCascade = shelf.Cascade().add((request) {
    if (request.url.path == 'a') {
      return shelf.Response.ok('handler a');
    }
    return shelf.Response.notFound('not found');
  }).add((request) {
    if (request.url.path == 'b') {
      return shelf.Response.ok('handler b');
    }
    return shelf.Response.notFound('not found');
  }).add((request) {
    if (request.headers['My-Custom-Header'] != null) {
      return shelf.Response.ok(request.headers['My-Custom-Header']);
    }
    return shelf.Response.notFound('not found');
  }).handler;

  /// Pipeline handlers
  final handler = const shelf.Pipeline()
      .addMiddleware(shelf.logRequests())
      .addMiddleware((innerHandler) => (request) async {
            final updateRequest = request.change(
              headers: {'My-Custom-Header': 'custom header value'},
            );
            return await innerHandler(updateRequest);
          })
      .addHandler(handlerCascade);

  /// Create a shelf server
  final server = await io.serve(handler, _hostname, _port);
  print('Serving at http://${server.address.host}:${server.port}');
}

import 'dart:convert';

import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;

import 'api.dart';

const _hostname = '192.168.0.113';
const _port = 8080;

void main(List<String> args) async {
  /// Cascades handles
  final handlerCascade = shelf.Cascade().add((request) {
    if (request.url.path == MposApi.login) {
      var userAccount = request.url.queryParameters['userAccount'];
      var password = request.url.queryParameters['password'];
      if (userAccount == 'test001' && password == '2077_@mpos') {
        return shelf.Response.ok(
          json.encode(MposApi.loginResult),
          encoding: Encoding.getByName('utf-8'),
          headers: {'Content-Type': 'application/json'},
        );
      }
    }
    return shelf.Response.notFound('not found');
  }).add((request) {
    if (request.url.path == MposApi.channelList) {
      var businessType = request.url.queryParameters['businessType'];
      var type = int.tryParse(businessType);
      var data;
      switch (type) {
        case 1:
          data = json.encode(MposApi.channelListCashinResult);
          break;
        case 2:
          data = json.encode(MposApi.channelListSendResult);
          break;
        default:
          return shelf.Response.notFound('not found');
      }
      return shelf.Response.ok(
        data,
        encoding: Encoding.getByName('utf-8'),
        headers: {'Content-Type': 'application/json'},
      );
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

import 'package:shelf/shelf_io.dart' as shelf_io;

import 'services/gloabl.dart';

const _hostname = '192.168.31.116';
const _port = 8080;

void main() async {
  final service = GlobalService();
  final server = await shelf_io.serve(service.handler, _hostname, _port);
  print('Server running on localhost:${server.port}');
}

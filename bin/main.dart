import 'package:shelf/shelf_io.dart' as shelf_io;

import 'services/gloabl.dart';

void main() async {
  final service = GlobalService();
  final server = await shelf_io.serve(service.handler, '192.168.31.116', 8080);
  print('Server running on localhost:${server.port}');
}

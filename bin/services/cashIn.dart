import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../data/api.dart';

class CashInService {
  Router get router {
    final router = Router();

    router.post('/channelList', (Request request) async {
      var body = await request.readAsString();
      var parameters = jsonDecode(body);
      var businessType = parameters['businessType'];
      switch (businessType) {
        case 1:
          return Response.ok(
            json.encode(Mock.channelListCashinResult),
            encoding: Encoding.getByName('utf-8'),
            headers: {'Content-Type': 'application/json'},
          );
        case 2:
          return Response.ok(
            json.encode(Mock.channelListSendResult),
            encoding: Encoding.getByName('utf-8'),
            headers: {'Content-Type': 'application/json'},
          );
        default:
          return Response.notFound('not found');
      }
    });
    return router;
  }
}

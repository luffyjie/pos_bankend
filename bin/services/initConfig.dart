import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../data/api.dart';

class InitConfigService {
  Handler get router {
    final router = Router();

    router.post('/initConfig', (Request request) async {
      return Response.ok(
        json.encode(Mock.initConfigResult),
        encoding: Encoding.getByName('utf-8'),
        headers: {'Content-Type': 'application/json'},
      );
    });

    return router;
  }
}

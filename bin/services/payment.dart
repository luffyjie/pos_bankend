import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../data/api.dart';

class PaymentService {
  Handler get router {
    final router = Router();

    router.post('/panel', (Request request) async {
      return Response.ok(
        json.encode(Mock.panelResult),
        encoding: Encoding.getByName('utf-8'),
        headers: {'Content-Type': 'application/json'},
      );
    });

    router.post('/orderPay', (Request request) async {
      Response.ok(
        json.encode(Mock.orderPayResult),
        encoding: Encoding.getByName('utf-8'),
        headers: {'Content-Type': 'application/json'},
      );
    });

    return router;
  }
}

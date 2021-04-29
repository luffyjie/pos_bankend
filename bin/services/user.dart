import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../data/api.dart';

class UserService {
  Handler get router {
    final router = Router();

    router.post('/login', (Request request) async {
      var body = await request.readAsString();
      var parameters = jsonDecode(body);
      var userAccount = parameters['userAccount'];
      var password = parameters['password'];
      if (userAccount == 'Test' && password == '2077') {
        return Response.ok(
          json.encode(Mock.loginResult),
          encoding: Encoding.getByName('utf-8'),
          headers: {'Content-Type': 'application/json'},
        );
      }
    });

    router.post('/queryUserInfo', (Request request) async {
      var token = request.headers['token'];
      if (token == null) {
        Response.ok(
          json.encode(Mock.queryUserInfoResult),
          encoding: Encoding.getByName('utf-8'),
          headers: {'Content-Type': 'application/json'},
        );
      }
    });

    return router;
  }
}

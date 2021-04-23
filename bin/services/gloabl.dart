import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'cashIn.dart';
import 'user.dart';

class GlobalService {
  Handler get handler {
    final router = Router();

    /// GET
    router.get('/say/<name>', (Request request, String name) {
      return Response.ok('hi $name');
    });

    router.mount('/api/v1/user/', UserService().router);
    router.mount('/api/v1/channel/', CashInService().router);

    router.all('/<ignored|.*>', (Request request) {
      return Response.notFound('Page not found');
    });

    return router;
  }
}

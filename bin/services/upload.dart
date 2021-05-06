import 'dart:io';
import 'package:mime/mime.dart';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class UploadService {
  Router get router {
    final router = Router();

    router.get('/<name>', (Request request, String name) async {
      var file = File('upload/$name');
      if (await file.exists()) {
        var fileStream = file.openRead();
        return Response.ok(
          fileStream,
          headers: {
            'Content-Type': lookupMimeType(request.url.path) ?? 'image/png'
          },
        );
      }
      return Response.notFound('not found');
    });
    return router;
  }
}

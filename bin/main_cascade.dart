import 'dart:convert';
import 'dart:io';
import 'package:mime/mime.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;

import 'data/api.dart';

void main(List<String> args) async {
  /// image
  var uploadDir = 'upload';
  var currentDirectory = Directory(uploadDir);
  var images = [];
  await for (var fileEntity in currentDirectory.list()) {
    images.add(fileEntity.uri.path);
  }

  /// Cascades handles
  final handlerCascade = shelf.Cascade().add((request) {
    if (request.url.path == 'say') {
      var name = request.url.queryParameters['name'];
      return shelf.Response.ok('get request test$name');
    }
    return shelf.Response.notFound('not found');
  }).add((request) async {
    if (request.url.path == 'api/v1/user/login') {
      var body = await request.readAsString();
      var parameters = jsonDecode(body);
      var userAccount = parameters['userAccount'];
      var password = parameters['password'];
      if (userAccount == 'Test' && password == '2077@test') {
        return shelf.Response.ok(
          json.encode(Mock.loginResult),
          encoding: Encoding.getByName('utf-8'),
          headers: {'Content-Type': 'application/json'},
        );
      }
    }
    return shelf.Response.notFound('not found');
  }).add((request) {
    if (request.url.path == 'api/v1/user/queryUserInfo') {
      return shelf.Response.ok(
        json.encode(Mock.queryUserInfoResult),
        encoding: Encoding.getByName('utf-8'),
        headers: {'Content-Type': 'application/json'},
      );
    }
    return shelf.Response.notFound('not found');
  }).add((request) async {
    if (request.url.path == Mock.channelList) {
      var body = await request.readAsString();
      var parameters = jsonDecode(body);
      var businessType = parameters['businessType'];
      switch (businessType) {
        case 1:
          return shelf.Response.ok(
            json.encode(Mock.channelListCashinResult),
            encoding: Encoding.getByName('utf-8'),
            headers: {'Content-Type': 'application/json'},
          );
        case 2:
          return shelf.Response.ok(
            json.encode(Mock.channelListSendResult),
            encoding: Encoding.getByName('utf-8'),
            headers: {'Content-Type': 'application/json'},
          );
        default:
          return shelf.Response.notFound('not found');
      }
    }
    return shelf.Response.notFound('not found');
  }).add((request) async {
    var pathSegments = request.url.pathSegments;
    if (pathSegments.first == Mock.upload) {
      var file = File(request.url.path);
      if (await file.exists()) {
        var fileStream = file.openRead();
        return shelf.Response.ok(
          fileStream,
          headers: {
            'Content-Type': lookupMimeType(request.url.path) ?? 'image/png'
          },
        );
      }
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
  final server = await io.serve(handler, '192.168.31.116', 8080);
  print('Serving at http://${server.address.host}:${server.port}');
}

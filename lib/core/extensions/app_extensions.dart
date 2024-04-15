import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension BuildContextX on BuildContext {
  // Width and height of the screen
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;

  // Text theme of the app
  TextTheme get textTheme => Theme.of(this).textTheme;

  // GoRouter extension
  GoRouterState get goRouterState => GoRouterState.of(this);
  Map<String, String> get pathParams => goRouterState.pathParameters;
}

extension ResponseX on Response {
  bool get isSuccess => statusCode == 200;
  bool get isCreated => statusCode == 201;
  bool get isAccepted => statusCode == 202;
  bool get isNoContent => statusCode == 204;
  bool get isConflict => statusCode == 409;
}

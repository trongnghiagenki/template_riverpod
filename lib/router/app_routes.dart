part of 'app_router.dart';

enum AppRoutes {
  login,
  home,
  notFound,
  unauthorized,
  categories;

  /// Get route name in param case starting with '/'
  String get initLocation => switch (this) {
        AppRoutes.notFound => '/404',
        AppRoutes.unauthorized => '/401',
        _ => '/${name.toParamCase()}',
      };

  /// Get route name in param case
  String get location => name.toParamCase();
}

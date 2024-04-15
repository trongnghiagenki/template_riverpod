import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../features/app/presentation/home/home_screen.dart';
import '../features/authentication/presentation/login/login_screen.dart';
import '../services/auth/auth_service.dart';
import 'not_found_screen.dart';
import 'unauthorized_screen.dart';

part 'app_router.g.dart';
part 'app_routes.dart';

@riverpod
BuildContext? appRouterContext(AppRouterContextRef ref) {
  return ref.read(goRouterProvider).routerDelegate.navigatorKey.currentContext;
}

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  final talker = Talker();
  final authService = ref.read(authServiceProvider);
  final defaultLocation = AppRoutes.home.initLocation;
  final loginLocation = AppRoutes.login.initLocation;
  const restorationScopeId = 'app_router';
  final rootNavigatorKey = GlobalKey<NavigatorState>();

  /// Login Guard: Redirect to home if authenticated
  String? loginGuard(BuildContext context, GoRouterState state) {
    if (authService.isAuthenticated) {
      return defaultLocation;
    } else {
      return null;
    }
  }

  /// Auth Guard: Redirect to login if not authenticated
  String? authGuard(BuildContext context, GoRouterState state) {
    if (authService.isAuthenticated) {
      return null;
    } else {
      Uri uri = Uri(path: loginLocation);
      return uri.toString();
    }
  }

  return GoRouter(
    initialLocation: defaultLocation,
    restorationScopeId: restorationScopeId,
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    observers: [TalkerRouteObserver(talker)],
    routes: [
      GoRoute(
        path: AppRoutes.login.initLocation,
        name: AppRoutes.login.name,
        redirect: loginGuard,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.home.initLocation,
        name: AppRoutes.home.name,
        redirect: authGuard,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const HomeScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.notFound.initLocation,
        name: AppRoutes.notFound.name,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const NotFoundScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.unauthorized.initLocation,
        name: AppRoutes.unauthorized.name,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const UnauthorizedScreen(),
        ),
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}

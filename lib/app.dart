import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../core/core.dart';
import 'router/app_router.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);

    return EasyLocalization(
        path: LocaleConstants.path,
        startLocale: LocaleConstants.ja,
        supportedLocales: const [
          LocaleConstants.ja,
          LocaleConstants.en,
        ],
        child: Builder(builder: (context) {
          return MaterialApp.router(
            scrollBehavior: AppScrollBehavior(),
            routerConfig: goRouter,
            debugShowCheckedModeBanner: false,
            restorationScopeId: 'app',
            theme: AppThemes.lightTheme,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            builder: EasyLoading.init(
              builder: (context, child) {
                // Init services here to make sure storage, router, etc...
                // are ready
                initService(ref);
                return child!;
              },
            ),
          );
        }));
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}

void initService(WidgetRef ref) {}

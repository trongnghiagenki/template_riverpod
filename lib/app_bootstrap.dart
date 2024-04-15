import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;
import 'package:talker_flutter/talker_flutter.dart';

import 'core/core.dart';
import 'services/auth/auth_service.dart';
import 'services/storage/storage_service.dart';

Future<ProviderContainer> appBootstrap(WidgetsBinding binding) async {
  binding.deferFirstFrame();

  // Setup error handling
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };

  // Cache images in assets folder via using the Flutter Engine binding lifecycle.
  binding.addPostFrameCallback((_) {
    final Element? context = binding.rootElement;
    if (context != null) {
      for (final asset in precacheAssetsList) {
        precacheImage(
          AssetImage(asset),
          context,
        );
      }
    }
  });

  // Setup EasyLoading
  EasyLoading.instance
    ..maskType = EasyLoadingMaskType.custom
    ..maskColor = Colors.black.withOpacity(0.5)
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = Colors.white
    ..indicatorColor = Colors.blue
    ..textColor = Colors.black;

  // Only for Flutter, dart apps require listening to container to get changes as
  // ProviderObserver plugs into the widget lifecycle.
  final container = ProviderContainer(
    observers: [
      RiverpodObserver(),
    ],
  );

  // Initialize core services (storage, auth,...)
  await _appInitProviders(container);

  binding.allowFirstFrame();

  return container;
}

Future<void> _appInitProviders(ProviderContainer container) async {
  final talker = Talker();
  talker.info('Initializing providers...');
  await container.read(storageServiceProvider.future);
  container.read(authServiceProvider);
  talker.info('All providers initialized!');
}

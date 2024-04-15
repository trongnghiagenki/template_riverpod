import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'app.dart';
import 'app_bootstrap.dart';
import 'core/core.dart';

void main() {
  final talker = TalkerFlutter.init();
  runZonedGuarded<Future<void>>(() async {
    // Ensure Flutter binding is initialized
    final binding = WidgetsFlutterBinding.ensureInitialized();

    FlavorConfig(
      name: Flavor.prod.name,
      variables: {
        FlavorConstants.baseUrl: '',
      },
    );

    runApp(
      UncontrolledProviderScope(
        container: await appBootstrap(binding),
        child: const MyApp(),
      ),
    );
  }, (e, s) {
    talker.handle(e, s, 'ZonedGuarded: Uncaught exception!');
  });
}

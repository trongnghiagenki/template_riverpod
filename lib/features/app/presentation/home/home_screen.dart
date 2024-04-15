import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/core.dart';
import '../../../../services/auth/auth_service.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(authServiceProvider).logout();
        },
        child: const Icon(Icons.logout),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final userInfo = ref.watch(authServiceProvider).userInfo;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(LanguageKey.homeScreen).tr(),
                const SizedBox(height: 20),
                Text('Email: ${userInfo?.email}'),
                const SizedBox(height: 20),
                Text('Name: ${userInfo?.name}'),
                const SizedBox(height: 20),
                Image.network(
                  userInfo?.avatar ?? '',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

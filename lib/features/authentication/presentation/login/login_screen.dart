import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/core.dart';
import '../../../../router/app_router.dart';
import '../providers/login.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(loginProvider, (previous, next) {
      if (previous != null && previous.isLoading) {
        switch (next) {
          case Success():
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            context.goNamed(AppRoutes.home.name);
            break;
          case Error(error: final e):
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(e.message),
              ),
            );
            break;
          default:
            break;
        }
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _changeLanguage(context),
        child: const Icon(Icons.translate),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(LanguageKey.loginScreen).tr(),
              const Gap(16),
              Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(loginProvider);
                  return ElevatedButton(
                    onPressed: () {
                      if (state.isLoading) return;
                      ref.read(loginProvider.notifier).login();
                    },
                    child: state.isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text('Login'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _changeLanguage(BuildContext context) {
    if (context.locale == LocaleConstants.en) {
      context.setLocale(LocaleConstants.ja);
    } else {
      context.setLocale(LocaleConstants.en);
    }
  }
}

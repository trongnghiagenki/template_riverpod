import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:talker_flutter/talker_flutter.dart';

class RiverpodObserver extends ProviderObserver {
  final talker = Talker();

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    talker.info(
        '${provider.name ?? provider.runtimeType}\n---\n[Previous State]\n$previousValue\n---\n[New State]\n$newValue');
  }
}

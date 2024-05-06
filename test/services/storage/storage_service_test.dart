import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod_structure/services/storage/storage_service.dart';

class MockBox extends Mock implements Box {}

void main() {
  group('StorageService', () {
    TestWidgetsFlutterBinding.ensureInitialized();

    Future<ProviderContainer> makeProviderContainer(Box box) async {
      final container = ProviderContainer(
        overrides: [
          storageServiceProvider.overrideWith(
            (ref) => StorageService(box),
          ),
        ],
      );
      addTearDown(container.dispose);
      return container;
    }

    test('should initialize secure storage', () async {
      final box = MockBox();
      final container = await makeProviderContainer(box);
      final storageService =
          await container.read(storageServiceProvider.future);
      expect(storageService, isNotNull);
      verifyNoMoreInteractions(box);
    });

    test('readValue should return correct value', () async {
      final box = MockBox();
      final container = await makeProviderContainer(box);
      final storageService =
          await container.read(storageServiceProvider.future);
      when(() => box.get('key', defaultValue: 'default')).thenReturn('value');

      final value = storageService.readValue('key', 'default');
      verify(() => box.get('key', defaultValue: 'default')).called(1);
      verifyNoMoreInteractions(box);
      expect(value, 'value');
    });

    test('readValue should return default value if key does not exist',
        () async {
      final box = MockBox();
      final container = await makeProviderContainer(box);
      final storageService =
          await container.read(storageServiceProvider.future);
      when(() => box.get('wrongKey', defaultValue: 'default'))
          .thenReturn('default');

      final value = storageService.readValue('wrongKey', 'default');
      verify(() => box.get('wrongKey', defaultValue: 'default')).called(1);
      verifyNoMoreInteractions(box);
      expect(value, 'default');
    });

    test('writeValue should write value to box', () async {
      final box = MockBox();
      final container = await makeProviderContainer(box);
      final storageService =
          await container.read(storageServiceProvider.future);

      when(() => box.put('key', 'value')).thenAnswer((_) => Future.value(null));

      storageService.writeValue('key', 'value');
      verify(() => box.put('key', 'value')).called(1);
      verifyNoMoreInteractions(box);
    });

    test('watch should return a Stream of BoxEvent', () async {
      final box = MockBox();
      final container = await makeProviderContainer(box);
      final storageService =
          await container.read(storageServiceProvider.future);
      when(() => box.watch(key: 'key')).thenAnswer((_) async* {
        for (int i = 0; i < 3; i++) {
          await Future.delayed(const Duration(milliseconds: 100));
          yield BoxEvent('key', 'value $i', false);
        }
      });

      final stream = storageService.watch(key: 'key');
      expect(stream, isA<Stream<BoxEvent>>());
      verify(() => box.watch(key: 'key')).called(1);
      verifyNoMoreInteractions(box);
    });
  });
}

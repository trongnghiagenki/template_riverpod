import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_structure/features/categories/data/dtos/categories_dto.dart';
import 'package:riverpod_structure/features/categories/presentation/providers/categories.dart';

class CategoriesScreen extends ConsumerWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<CategoriesDto> listCategories =
        ref.watch(categoriesProvider).listCategories;

    return Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _buildItem(context, listCategories[index], ref);
        },
        itemCount: listCategories.length,
      ),
    );
  }

  Widget _buildItem(
    BuildContext context,
    CategoriesDto category,
    WidgetRef ref,
  ) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(category.name ?? ''),
          ),
          Image.network(
            category.image ?? '',
            width: 80,
            height: 80,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error);
            },
          )
        ],
      ),
    );
  }
}

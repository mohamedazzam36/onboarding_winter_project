import 'package:flutter/material.dart';
import 'package:onboarding_winter_project/core/resources/app_colors.dart';
import 'package:onboarding_winter_project/features/home/domain/entities/categories_entity.dart';

class CategoriesListViewItem extends StatelessWidget {
  const CategoriesListViewItem({super.key, required this.categoriesEntity});

  final CategoriesEntity categoriesEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        CircleAvatar(
          radius: 36,
          backgroundImage: NetworkImage(
            categoriesEntity.imageUrl,
          ),
        ),
        Text(
          categoriesEntity.title,
          style: const TextStyle(color: AppColors.blackColor),
        ),
      ],
    );
  }
}

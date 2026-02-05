import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding_winter_project/core/di/module.dart';
import 'package:onboarding_winter_project/core/resources/app_colors.dart';
import 'package:onboarding_winter_project/features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:onboarding_winter_project/features/home/presentation/widgets/categories_list_view.dart';

class CategoriesListViewSection extends StatelessWidget {
  const CategoriesListViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CategoriesCubit>(),
      child: Container(
        padding: const EdgeInsets.all(12),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: const CategoriesListView(),
      ),
    );
  }
}

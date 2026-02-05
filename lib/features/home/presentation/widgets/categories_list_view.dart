import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding_winter_project/features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:onboarding_winter_project/features/home/presentation/widgets/categories_list_view_item.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({super.key});

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  @override
  void initState() {
    context.read<CategoriesCubit>().getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        switch (state) {
          case ProductsInitial():
          case ProductsLoading():
            return const Center(
              child: SizedBox(width: 24, height: 24, child: CircularProgressIndicator()),
            );

          case ProductsSuccess():
            return ListView.separated(
              itemCount: state.categories.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemBuilder: (context, index) =>
                  CategoriesListViewItem(categoriesEntity: state.categories[index]),
            );

          case ProductsFailure():
            return Text(state.errorMessage);
        }
      },
    );
  }
}

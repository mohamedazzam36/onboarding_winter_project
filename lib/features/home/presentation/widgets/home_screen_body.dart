import 'package:flutter/material.dart';
import 'package:onboarding_winter_project/core/common_widgets/sort_and_filter_widget.dart';
import 'package:onboarding_winter_project/core/resources/app_colors.dart';
import 'package:onboarding_winter_project/features/home/presentation/widgets/categories_list_view_section.dart';
import 'package:onboarding_winter_project/features/home/presentation/widgets/home_text_field.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Column(
        spacing: 16,
        children: [
          HomeTextField(
            hintText: 'Search any Product..',
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.greyA8Color,
            ),
            suffixIcon: Icon(
              Icons.mic,
              color: AppColors.greyA8Color,
            ),
          ),
          SortAndFilterWidget(title: 'All Featured'),
          SizedBox(height: 125, child: CategoriesListViewSection()),
        ],
      ),
    );
  }
}

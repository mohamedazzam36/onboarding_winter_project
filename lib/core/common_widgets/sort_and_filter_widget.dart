import 'package:flutter/material.dart';
import 'package:onboarding_winter_project/core/resources/app_colors.dart';
import 'package:onboarding_winter_project/core/resources/app_text_styles.dart';

class SortAndFilterWidget extends StatelessWidget {
  const SortAndFilterWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppTextStyles.blackColor18SemiBold,
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Text(
                'Sort',
                style: AppTextStyles.grey67Color12Medium.copyWith(color: AppColors.blackColor),
              ),
              const Icon(
                Icons.swap_vert,
                color: AppColors.blackColor,
                size: 18,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Text(
                'Filter',
                style: AppTextStyles.grey67Color12Medium.copyWith(color: AppColors.blackColor),
              ),
              const Icon(
                Icons.filter_alt,
                color: AppColors.blackColor,
                size: 18,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

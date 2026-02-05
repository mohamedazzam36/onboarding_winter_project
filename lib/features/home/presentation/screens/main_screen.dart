import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onboarding_winter_project/core/resources/app_colors.dart';
import 'package:onboarding_winter_project/core/resources/app_images.dart';
import 'package:onboarding_winter_project/features/home/presentation/widgets/home_screen_body.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        actionsPadding: const EdgeInsets.only(right: 16),
        leadingWidth: 60,
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            return FittedBox(
              fit: BoxFit.scaleDown,
              child: IconButton(
                padding: const EdgeInsets.all(0),
                style: IconButton.styleFrom(backgroundColor: AppColors.greyC4Color.withAlpha(100)),
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: const Icon(Icons.menu),
              ),
            );
          },
        ),
        title: SvgPicture.asset(AppImages.logoImage, width: 100),
        actions: [SvgPicture.asset(AppImages.user, width: 36)],
      ),
      drawer: const Drawer(),
      body: const HomeScreenBody(),
    );
  }
}

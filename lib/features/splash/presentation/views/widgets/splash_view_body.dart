import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interactive_care/core/styles/assets.dart';
import 'package:interactive_care/core/utils/app_router.dart';
import 'package:interactive_care/features/splash/presentation/views/widgets/fade_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    initFadeAnimation();

    navigateTo();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AssetsData.logo,
          height: MediaQuery.of(context).size.height*0.2,
        ),
        FadeText(fadeAnimation: fadeAnimation),
      ],
    );
  }

  void initFadeAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(animationController);
    animationController.forward();
  }

  void navigateTo() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        GoRouter.of(context).go(AppRouter.kLogIn);
      },
    );
  }
}

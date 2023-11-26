import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interactive_care/constants.dart';
import 'package:interactive_care/core/styles/assets.dart';
import 'package:interactive_care/core/utils/app_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: KAppPadding,
        right: KAppPadding,
        top: 40,
        bottom: 30.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AssetsData.logo,
            height: 35,
          ),
          Text(
            'Dashboard',
          ),
          // const Spacer(),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kLogIn);
            },
            icon: const Icon(
              Icons.login,
            ),
          ),
        ],
      ),
    );
  }
}

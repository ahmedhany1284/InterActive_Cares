import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interactive_care/features/dashboard_page/dashboard.dart';

import 'package:interactive_care/features/login/presentation/view/login_screen.dart';
import 'package:interactive_care/features/regester/presentaion/view/register_screen.dart';
import 'package:interactive_care/features/splash/splash_view.dart';

abstract class AppRouter {
  static const kSplashView = '/';
  static const kDashboard = '/dashboard';
  static const kLogIn = '/login';
  static const kRegister = '/register';
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[

      GoRoute(
        path: kSplashView,
        builder: (BuildContext context, GoRouterState state) =>
        const SplashView(),
      ),
      GoRoute(
        path: kDashboard,
        builder: (BuildContext context, GoRouterState state) =>
        const Dashboard(),
      ),
      GoRoute(
        path: kLogIn,
        builder: (BuildContext context, GoRouterState state) =>
            LoginScreen(),
      ),
      GoRoute(
        path: kRegister,
        builder: (BuildContext context, GoRouterState state) =>
            RegisterScreen(),
      ),
    ],
  );
}
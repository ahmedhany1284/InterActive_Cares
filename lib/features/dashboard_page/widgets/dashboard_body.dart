import 'package:flutter/material.dart';
import 'package:interactive_care/features/dashboard_page/widgets/custom_app_bar.dart';



class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),


        ],
      ),
    );
  }
}

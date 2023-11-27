import 'package:flutter/material.dart';
import 'package:interactive_care/constants.dart';
import 'package:interactive_care/core/styles/styles.dart';
import 'package:interactive_care/features/dashboard_page/presentaion/view/widgets/custom_app_bar.dart';
import 'package:interactive_care/features/dashboard_page/presentaion/view/widgets/enrolled_cources_list_view.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(pageName: 'Dashboard',),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: KAppPadding),
              child: Align(
                alignment: AlignmentDirectional.bottomStart,
                child: Text(
                  'Enrolled : ',
                  style: Styles.textStyle18,
                ),
              ),
            ),
            SizedBox(height: 10.0,),
            EnrolledCoursesListView(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:interactive_care/features/dashboard_page/presentaion/view/widgets/enrolled_item_list_view_item.dart';

class EnrolledCoursesListView extends StatelessWidget {
  const EnrolledCoursesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: EnrolledCourseItem(),
        );
      },
    );
  }
}

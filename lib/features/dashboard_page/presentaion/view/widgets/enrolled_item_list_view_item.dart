import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interactive_care/constants.dart';
import 'package:interactive_care/core/styles/styles.dart';
import 'package:interactive_care/core/utils/app_router.dart';
import 'package:interactive_care/core/widgets/dafault_text%20_button.dart';
import 'package:interactive_care/features/dashboard_page/presentaion/view/widgets/custom_image.dart';

class EnrolledCourseItem extends StatelessWidget {
  const EnrolledCourseItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.kCourseDetails,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: KAppPadding,
        ),
        child: SizedBox(
          height: 125,
          child: Row(
            children: [
              const CustomImage(
                imageURL: 'https://interactivecares-courses.com/wp-content/uploads/2021/10/5618169-scaled.jpg',
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        'Android App Development',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle18.copyWith(),
                      ),
                    ),
                    const SizedBox(
                      height: 3.0,
                    ),
                    Row(
                      children: [
                        const Text(
                          '5,000.00 ৳ ',
                          style: Styles.textStyle14,
                        ),
                        const Spacer(),
                        defaultTextButton(
                          function: () {
                            context.push(AppRouter.kCourseDetails);
                          },
                          text: 'Continue',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

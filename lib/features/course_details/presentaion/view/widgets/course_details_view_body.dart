import 'package:flutter/material.dart';
import 'package:interactive_care/core/styles/styles.dart';
import 'package:interactive_care/features/dashboard_page/presentaion/view/widgets/custom_app_bar.dart';
import 'package:interactive_care/features/course_details/presentaion/view/widgets/video_player.dart';

class CourseDetailsViewBody extends StatelessWidget {
  const CourseDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Column(
              children: [
                const CustomAppBar(pageName: 'Course'),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Complete Flutter App Development Career Path',
                      style: Styles.textStyle18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.32,
                  width: MediaQuery.of(context).size.width * 0.98,
                  child: const VideoPlayerPage(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // i will navigate to the next video
                        },
                        child: const Icon(Icons.skip_next),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _showVideoListSnackBar(context);
                        },
                        child: const Text('Show Video List'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // i will navigate to the previous video
                        },
                        child: const Icon(Icons.skip_previous_outlined),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'About This Course',
                      style: Styles.textStyle18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Want to simultaneously develop apps for mobile and desktop platforms? If you want to develop a separate app for almost all platforms, it will take time and effort. But how about developing apps for more than two platforms using the same codebase at the same time, with minimal effort? This is exactly what is possible with Flutter framework of Dart programming language. ',
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Again, when looking for app developer jobs on LinkedIn, the first requirement that comes to mind is whether Flutter is known. Flutter developers get priority in more than 70% of app development jobs. It is understood how much demand Flutter is holding in the job market.',
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                        'And so Flutter App Development Career Path is bringing Interactive Cares to fill up this gap in the job market. We have a variety of learning assessments for interactive learning in this career path. In this long career path of 6 months, there are 150+ prerecorded videos, 50 live classes, several projects and assignments for you. And along with these, there are 2 daily support sessions and conceptual classes as exclusive features.'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                        'Our career path instructors are:\n \n Ashif Mujtaba \n has 9 years of experience in the app development industry \n \n AFM Mohaiminul Zoya, a former Solution Engineer of Vikas, is staying with him as a support instructor. \n \n Enroll in our App Development Career Path today to make your dream of becoming an app developer a reality. '),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showVideoListSnackBar(BuildContext context) {
    List<Map<String, String>> videos = [
      {
        "name": "Video 1",
        "link":
            "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"
      },
      {
        "name": "Video 2",
        "link":
            "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"
      },
      {
        "name": "Video 3",
        "link":
            "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"
      },
    ];

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var video in videos)
              ListTile(
                title: Align(
                  child: Text(
                    video["name"] ?? "",
                    style: Styles.textStyle14.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                onTap: () {
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.26,
                    width: MediaQuery.of(context).size.width * 0.98,
                    child: const VideoPlayerPage(),
                  );
                  print("Clicked on ${video["name"]} - ${video["link"]}");
                },
              ),
          ],
        ),
        duration: const Duration(days: 1),
      ),
    );
  }
}

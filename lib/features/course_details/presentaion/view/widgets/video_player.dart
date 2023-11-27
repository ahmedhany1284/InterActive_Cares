import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({super.key});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late CustomVideoPlayerController _customVideoPlayerController;
  Uri videoUri = Uri.parse(
      "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4");

  late bool isLoading = true;
  Duration? bookmarkedPosition;

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer();
    loadBookmarkedPosition();
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    saveBookmarkedPosition();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                bookmarkVideo();
              },
              child: Text('Bookmark Current Position'),
            ),
          ],
        ),
        if (!isLoading)
          CustomVideoPlayer(
            customVideoPlayerController: _customVideoPlayerController,
          ),

      ],
    );
  }



  void initializeVideoPlayer() {
    setState(() {
      isLoading = true;
    });
    VideoPlayerController videoPlayerController;
    videoPlayerController = VideoPlayerController.networkUrl(videoUri)
      ..initialize().then((value) {
        setState(() {
          isLoading = false;
        });
      });

    videoPlayerController.addListener(() {
      if (videoPlayerController.value.isPlaying) {
        bookmarkedPosition = videoPlayerController.value.position;
      }
    });
    _customVideoPlayerController = CustomVideoPlayerController(
        context: context, videoPlayerController: videoPlayerController);
  }


  void bookmarkVideo() {
    if (bookmarkedPosition != null) {
      print('Bookmarked position: ${bookmarkedPosition!.inSeconds} seconds');
    }
  }

  Future<void> saveBookmarkedPosition() async {
    if (bookmarkedPosition != null) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setInt('bookmarkedPosition', bookmarkedPosition!.inSeconds);
    }
  }

  Future<void> loadBookmarkedPosition() async {
    final prefs = await SharedPreferences.getInstance();
    final bookmarkedSeconds = prefs.getInt('bookmarkedPosition');
    if (bookmarkedSeconds != null) {
      setState(() {
        bookmarkedPosition = Duration(seconds: bookmarkedSeconds);
      });
    }
  }
}

import 'package:video_player/video_player.dart';

abstract class CoursePlayerState {}

class CoursePlayerInitialState extends CoursePlayerState {}

class CoursePlayerLoadedState extends CoursePlayerState {
  final VideoPlayerController videoPlayerController;
  final List<String> modules;
  final String selectedModule;
  final List<Duration> bookmarks;

  CoursePlayerLoadedState({
    required this.videoPlayerController,
    required this.modules,
    required this.selectedModule,
    required this.bookmarks,
  });
}

class CoursePlayerClaimedCertificateState extends CoursePlayerState {}
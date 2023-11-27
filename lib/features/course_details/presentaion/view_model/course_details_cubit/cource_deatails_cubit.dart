import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chewie/chewie.dart';
import 'package:interactive_care/features/course_details/presentaion/view_model/course_details_cubit/cource_deatails_state.dart';
import 'package:video_player/video_player.dart';

class CoursePlayerCubit extends Cubit<CoursePlayerState> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  final List<String> _modules = ['Module 1', 'Module 2', 'Module 3']; // Replace with your modules
  List<Duration> _bookmarks = [];

  CoursePlayerCubit() : super(CoursePlayerInitialState());

  void loadVideo(String videoUrl) {
    _videoPlayerController = VideoPlayerController.networkUrl(videoUrl as Uri);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: false,
      looping: false,
    );

    emit(CoursePlayerLoadedState(
      videoPlayerController: _videoPlayerController,
      modules: _modules,
      selectedModule: _modules.first,
      bookmarks: _bookmarks,
    ));
  }

  void selectModule(String selectedModule) {
    emit(CoursePlayerLoadedState(
      videoPlayerController: _videoPlayerController,
      modules: _modules,
      selectedModule: selectedModule,
      bookmarks: _bookmarks,
    ));
  }

  void bookmark() {
    if (_videoPlayerController.value.isPlaying) {
      _bookmarks.add(_videoPlayerController.value.position);
      emit(CoursePlayerLoadedState(
        videoPlayerController: _videoPlayerController,
        modules: _modules,
        selectedModule: _modules.first,
        bookmarks: _bookmarks,
      ));
    }
  }

  void claimCertificate() {
    // Add logic for claiming certificate
    emit(CoursePlayerClaimedCertificateState());
  }

  @override
  Future<void> close() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    return super.close();
  }
}


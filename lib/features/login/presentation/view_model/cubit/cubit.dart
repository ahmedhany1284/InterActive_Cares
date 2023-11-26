
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interactive_care/features/login/presentation/view_model/cubit/states.dart';


class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  // Function to check if the user is already signed in
  void checkIfUserSignedIn({
    required String email,
    required String password,
  }) {
    if (FirebaseAuth.instance.currentUser != null) {
      userLogin(email:email ,password:password );
    }
    else{
      emit(LoginErrorState('User Not Found'));
    }
  }

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value) {
      emit(LoginSuccessState(value.user!.uid));
    }).catchError((error){
      emit(LoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void change_pass_visibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(LoginChangePasswordState());
  }
}

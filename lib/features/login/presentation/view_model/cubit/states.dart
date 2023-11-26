

abstract class LoginStates {}
class LoginInitialState extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{
  final String uId;

  LoginSuccessState(this.uId);

}
class LoginErrorState extends LoginStates
{
  final String error;

  LoginErrorState(this.error);
}
class LoginChangePasswordState extends LoginStates{}
class LoginRefreshState extends LoginStates{}


class SocialGetUserLodingState extends LoginStates{}
class SocialGetUserSuccessState extends LoginStates{}
class SocialGetUserErrorState extends LoginStates{}

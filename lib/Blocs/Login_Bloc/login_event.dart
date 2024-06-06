part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginInitialEvent extends LoginEvent{}

class LoginValidateEvent extends LoginEvent{
  final String userEmailValue;
  final String userPasswordValue;
  LoginValidateEvent(this.userEmailValue,this.userPasswordValue);
}

class LoginSuccessEvent extends LoginEvent{
  final String userEmail;
  final String userPassword;
  LoginSuccessEvent(this.userEmail,this.userPassword);

}


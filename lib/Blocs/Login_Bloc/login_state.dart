part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginValidateState extends LoginState{}

class LoginSucessState extends LoginState{}

class LoginErrorState extends LoginState{
  final String errorMessage;
  LoginErrorState(this.errorMessage);
}


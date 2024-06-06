part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

class RegisterInitialEvent extends RegisterEvent{}

class RegisterValidateEvent extends RegisterEvent{
  final String nameValue;
  final String emailValue;
  final String contactValue;
  final String passwordValue;
  final String confirmPassValue;

  RegisterValidateEvent(this.nameValue,this.emailValue,this.contactValue,this.passwordValue,this.confirmPassValue);

}

class RegisterSuccessEvent extends RegisterEvent{
  final String name;
  final String email;
  final String contact;
  final String password;
  final String confirmPass;

  RegisterSuccessEvent(this.name,this.email,this.contact,this.password,this.confirmPass);

}


import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterValidateEvent>((event, emit) {
      if(event.nameValue.isEmpty){
        emit(RegisterErrorState("please fill name"));
      }else if(event.emailValue.isEmpty){
        emit(RegisterErrorState("please fill email"));
      }else if(EmailValidator.validate(event.emailValue)==false){
        emit(RegisterErrorState("please fill correct email"));
      } else if(event.contactValue.isEmpty && event.contactValue.length>11){
        emit(RegisterErrorState("please fill contact"));
      }else if(event.passwordValue.isEmpty){
        emit(RegisterErrorState("please fill password"));
      } else if(event.confirmPassValue.isEmpty){
        emit(RegisterErrorState("please fill password"));
      } else if(event.confirmPassValue!=event.passwordValue){
        emit(RegisterErrorState("Password and Confirm Password Must be same"));
      }else if(event.passwordValue.length <8){
        emit(RegisterErrorState("Password value should not be less than 8"));

      } else {
        emit(RegisterValidateState());
      }
    });

    on<RegisterSuccessEvent>((event,emit){
      if(state is RegisterValidateState){
        emit(RegisterSucessState());
      }else{
        emit(RegisterErrorState("Please filled valid details"));
      }
    });
  }
}

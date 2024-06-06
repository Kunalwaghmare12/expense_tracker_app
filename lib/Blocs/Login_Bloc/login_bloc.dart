import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:email_validator/email_validator.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginValidateEvent>((event, emit) {
      if(EmailValidator.validate(event.userEmailValue)==false){
        emit(LoginErrorState("Please Enter correct email"));
      }
      else if(event.userPasswordValue.length <8){
        emit(LoginErrorState("Password must of length 8 or above"));
      }else{
        emit(LoginValidateState());
      }
    });

    on<LoginSuccessEvent>((event,emit){
      if(event.userEmail == "admin@gmail.com" && event.userPassword == "adminpass"){
        emit(LoginSucessState());
      }else{
        emit(LoginErrorState("Email Id is not registered please register"));
      }

    });
  }
}

import 'package:authentication/features/authentication/sign_up/bloc/signup_events.dart';
import 'package:authentication/features/authentication/sign_up/bloc/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState>{
  SignupBloc():super(SignupState()) {
    on<NameEvent>((event, emit) {
      
    },);
    on<PhoneEvent>((event, emit) {
      
    },);
    on<EmailEvent>((event, emit) {
      
    },);
    on<PasswordEvent>((event, emit) {
      
    },);
  }
}
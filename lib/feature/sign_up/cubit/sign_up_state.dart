part of 'sign_up_cubit.dart';

sealed class SignUpState {}

class InitState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUPErrorState extends SignUpState {
  final String error;

  SignUPErrorState(this.error);
}

class SignUpSuccessState extends SignUpState {}

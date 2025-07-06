part of 'sign_up_cubit.dart';

sealed class SignUpState extends Equatable {}

class InitState extends SignUpState {
  @override
  List<Object?> get props => [];
}

class SignUpLoadingState extends SignUpState {
  @override
  List<Object?> get props => [];
}

class SignUPErrorState extends SignUpState {
  final String error;

  SignUPErrorState(this.error);

  @override
  List<Object?> get props => [];
}

class SignUpSuccessState extends SignUpState {
  @override
  List<Object?> get props => [];
}

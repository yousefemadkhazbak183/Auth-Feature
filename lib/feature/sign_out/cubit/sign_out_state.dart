part of 'sign_out_cubit.dart';

sealed class SignOutState extends Equatable {}

class SignOutInitState extends SignOutState {
  @override
  List<Object?> get props => [];
}

class SignOutSuccessState extends SignOutState {
  @override
  List<Object?> get props => [];
}

class SignOutErrorState extends SignOutState {
  String errorMessage;

  SignOutErrorState(this.errorMessage);

  @override
  List<Object?> get props => [];
}

part of 'sign_in_cubit.dart';

sealed class SignInState extends Equatable {}

final class SignInInitial extends SignInState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class SignInLoading extends SignInState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class SignInSuccess extends SignInState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class SignInError extends SignInState {
  final String error;

  SignInError({required this.error});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_out_state.dart';

class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit() : super(SignOutInitState());

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    emit(SignOutSuccessState());
  }
}

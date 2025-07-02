import 'package:auth_feature/feature/sign_in/cubit/sign_in_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  final TextEditingController emailNameController = TextEditingController();

  final TextEditingController passwordNameController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> signIn(BuildContext context) async {
    if (context.read<SignInCubit>().formKey.currentState?.validate() == true) {
      // Sign In
      // AppDialog.showLoading(context, "Loading");
      emit(SignInLoading());

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailNameController.text.trim(),
          password: passwordNameController.text.trim(),
        );

        emit(SignInSuccess());
      } on FirebaseAuthException catch (user) {
        if (user.code == 'invalid-credential') {
        } else if (user.code == 'network-request-failed') {}
        emit(SignInError(error: user.toString()));
      } catch (error) {
        emit(SignInError(error: error.toString()));
      }
    }
  }

  @override
  Future<void> close() {
    emailNameController.dispose();
    passwordNameController.dispose();
    return super.close();
  }
}

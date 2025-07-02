import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> passwordReset(BuildContext context) async {
    if (context.read<ForgetPasswordCubit>().formKey.currentState?.validate() ==
        true) {
      emit(ForgetPasswordLoading());
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(
          email: context
              .read<ForgetPasswordCubit>()
              .emailController
              .text
              .trim(),
        );
        emit(ForgetPasswordSuccess());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'network-request-failed') {}
        emit(ForgetPasswordError(e.toString()));
      } catch (e) {
        e.toString();
        emit(ForgetPasswordError(e.toString()));
      }
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}

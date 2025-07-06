import 'package:auth_feature/feature/save_user/data/firebase_data.dart';
import 'package:auth_feature/feature/save_user/model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(InitState());

  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> signUp({required String email, required String password}) async {
    // register
    emit(SignUpLoadingState());

    try {
      final response = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      emit(SignUpSuccessState());
      final UserModel users = UserModel(
        id: response.user?.uid ?? '',
        name: firstNameController.text,
        email: email,
      );
      await FirebaseData.addUserToFireStore(users);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
      } else if (e.code == 'email-already-in-use') {
      } else if (e.code == 'network-request-failed') {}
      emit(SignUPErrorState(e.toString()));
    } catch (e) {
      emit(SignUPErrorState(e.toString()));
    }
  }

  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:requests_inspector/requests_inspector.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(InitState());
  final Dio _dio = Dio();
  final String apiKey = 'AIzaSyBYkM6hhIAZaInTdr4aULMaK4b39BGf-8g';

  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> signUp({required String email, required String password}) async {
    // register
    emit(SignUpLoadingState());

    try {
      final response = await _dio.get(
        'https://console.firebase.google.com/u/0/project/feature-ec/authentication/users?key=$apiKey ',
      );
      InspectorController().addNewRequest(
        RequestDetails(
          requestName: 'signInWithEmail',
          requestMethod: RequestMethod.POST,
          url:
              'https://console.firebase.google.com/u/0/project/feature-ec/authentication/users',
          statusCode: response.statusCode ?? 0,
          requestBody: response.data,
        ),
      );
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
     
      emit(SignUpSuccessState());
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

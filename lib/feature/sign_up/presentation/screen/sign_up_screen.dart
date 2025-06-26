import 'package:auth_feature/Home_screen.dart';
import 'package:auth_feature/core/widgets/dialog.dart';
import 'package:auth_feature/feature/sign_in/screen/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widget/custom_text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String routeName = '/sign_up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emilNameController = TextEditingController();

  TextEditingController passwordNameController = TextEditingController();

  TextEditingController confirmPasswordNameController = TextEditingController();

  final TextEditingController controller = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(title: Text("Welcome Back!")),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Welcome, Create Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
                const SizedBox(height: 40),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    const SizedBox(height: 22),
                    CustomTextFormField(
                      labelText: 'First Name',
                      controller: firstNameController,
                      valditor: (String? value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter First Name';
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      labelText: "Last Name",
                      controller: lastNameController,
                      valditor: (String? value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter First Name';
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      labelText: "Email",
                      controller: emilNameController,
                      valditor: (String? value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter Email';
                        }
                        final bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                        ).hasMatch(value);
                        if (!emailValid) {
                          return 'please enter valid email ';
                        }

                        return null;
                      },
                    ),

                    CustomTextFormField(
                      labelText: "Password",
                      controller: passwordNameController,
                      obscureText: true,
                      valditor: (String? value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter First Name';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 char';
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      labelText: "Confirm Password",
                      controller: confirmPasswordNameController,
                      obscureText: true,
                      valditor: (String? value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter First Name';
                        }
                        if (value != passwordNameController.text) {
                          return "confirm password doesn't match password.";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 22),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState?.validate() == true) {
                            signUp();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (builder) {
                                  return const SignInScreen();
                                },
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 45),
                          foregroundColor: const Color(0xFFFFFFFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: Colors.blue,
                        ),
                        child: const Text('Create Account'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                // SignInButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  signUp() async {
    if (formKey.currentState?.validate() == true) {
      // register
      DialogShow.showMessage(context: context, message: 'Loading...');
      try {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: emilNameController.text,
              password: passwordNameController.text,
            );
        DialogShow.hideLoading(context);
        DialogShow.showMessage(
          context: context,
          postActiveName: 'ok',
          message: 'Success',

          postAction: () {
            Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
          },
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          DialogShow.hideLoading(context);
          DialogShow.showMessage(
            context: context,
            postActiveName: 'ok',
            message: 'The password provided is too weak',
            title: 'Error',
          );
        } else if (e.code == 'email-already-in-use') {
          DialogShow.hideLoading(context);
          DialogShow.showMessage(
            context: context,
            postActiveName: 'ok',
            message: 'The account already exists for that email',
            title: 'Error',
          );
        } else if (e.code == 'network-request-failed') {
          DialogShow.hideLoading(context);
          DialogShow.showMessage(
            context: context,
            postActiveName: 'Ok',
            message: 'please check on Network ',
            title: 'Error',
          );
        }
      } catch (e) {
        DialogShow.hideLoading(context);
        DialogShow.showMessage(
          context: context,
          postActiveName: 'ok',
          message: e.toString(),
          title: e.toString(),
        );
      }
    }
  }
}

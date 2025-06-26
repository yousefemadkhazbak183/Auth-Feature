import 'package:auth_feature/Home_screen.dart';
import 'package:auth_feature/core/widgets/dialog.dart';
import 'package:auth_feature/feature/forget_password/widget/forget_button_widget.dart';
import 'package:auth_feature/feature/sign_in/widget/text_button_create_account.dart';
import 'package:auth_feature/feature/sign_up/presentation/widget/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String routeName = '/';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emilNameController = TextEditingController();

  TextEditingController passwordNameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome Back',
                style: TextStyle(color: Colors.blue, fontSize: 20),
              ),
              const SizedBox(height: 22),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextFormField(
                    labelText: 'Email',
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
                    labelText: 'Password',
                    obscureText: true,
                    controller: passwordNameController,
                    valditor: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter password';
                      }

                      return null;
                    },
                  ),
                  const ForgetButtonWidget(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        signIn();
                      },
                      child: const Text('SignIn'),
                    ),
                  ),
                  const TextButtonCreateAccount(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  signIn() async {
    if (formKey.currentState?.validate() == true) {
      // Sign In
      DialogShow.showLoading(context, "Loading");

      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
              email: emilNameController.text,
              password: passwordNameController.text,
            );
        DialogShow.hideLoading(context);
        DialogShow.showMessage(
          context: context,
          message: "Login Succsseflly",
          postActiveName: 'Ok',
          postAction: () {
            Navigator.of(context).pushNamed(HomeScreen.routeName);
          },
        );
      } on FirebaseAuthException catch (user) {
        if (user.code == 'invalid-credential') {
          DialogShow.hideLoading(context);
          DialogShow.showMessage(
            context: context,
            title: 'Error',
            postActiveName: "ok",
            message: "No user found for that email OR wrong Password",
          );
        } else if (user.code == 'network-request-failed') {
          DialogShow.hideLoading(context);
          DialogShow.showMessage(
            context: context,
            postActiveName: 'Ok',
            message:
                'A network error (such as timeout, interrupted connection or unreachable host) has occurred.',
            title: 'Error',
          );
        }
      } catch (error) {
        DialogShow.hideLoading(context);
        DialogShow.showMessage(
          context: context,
          postActiveName: 'OK',
          message: error.toString(),
        );
      }
    }
  }
}

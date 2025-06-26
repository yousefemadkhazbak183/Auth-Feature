import 'package:auth_feature/feature/sign_up/presentation/widget/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  static const String routeName = 'forget_password';

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emilNameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter your Email  reset password for you ',
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 22),
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
            TextButton(
              onPressed: () {
                passwordReset();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Check Email to update password'),
                  ),
                );
              },
              child: const Text(
                'Send Email',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }

  passwordReset() async {
    if (formKey.currentState?.validate() == true) {
      try {
        final response = await FirebaseAuth.instance.sendPasswordResetEmail(
          email: emilNameController.text,
        );
      } catch (e) {
        e.toString();
      }
    }
  }
}

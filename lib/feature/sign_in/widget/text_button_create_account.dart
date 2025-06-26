import 'package:auth_feature/feature/sign_up/presentation/screen/sign_up_screen.dart';
import 'package:flutter/material.dart';

class TextButtonCreateAccount extends StatelessWidget {
  const TextButtonCreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(),

      onPressed: () {
        Navigator.of(context).pushNamed(SignUpScreen.routeName);
      },
      child: const Text('Or Create Account!'),
    );
  }
}

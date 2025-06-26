import 'package:flutter/material.dart';

import '../../../sign_in/screen/sign_in_screen.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 50),
          backgroundColor: Colors.blue,
        ),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const SignInScreen();
              },
            ),
          );
        },
        child: const Text('Sign_up'),
      ),
    );
  }
}

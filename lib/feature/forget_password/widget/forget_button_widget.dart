import 'package:flutter/material.dart';

import '../screen/forget_password_screen.dart';

class ForgetButtonWidget extends StatelessWidget {
  const ForgetButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, ForgetPasswordScreen.routeName);
        },
        child: const Text('Forget Password'),
      ),
    );
  }
}

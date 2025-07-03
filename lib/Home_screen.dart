import 'package:flutter/material.dart';

import 'core/theming/app_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Never Give Up !!!!!!!!!!!!!! ',
                style: AppStyles.font20Blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

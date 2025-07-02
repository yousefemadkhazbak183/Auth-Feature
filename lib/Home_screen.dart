import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Never Give Up !!!!!!!!!!!!!! ',
                style: TextStyle(color: Colors.red, fontSize: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

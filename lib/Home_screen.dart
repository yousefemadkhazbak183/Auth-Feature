
import 'package:auth_feature/sensor_mobile.dart';
import 'package:auth_feature/shake_gesture_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),

      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ShakeGestureWidget(),
          SensorMobile(),

          // This causes the overflow
        ],
      ),
    );
  }
}

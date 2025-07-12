import 'package:auth_feature/core/theming/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:shake_gesture/shake_gesture.dart';

class ShakeGestureWidget extends StatelessWidget {
  const ShakeGestureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ShakeGesture(
      onShake: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Shake detected!')));
      },
      child:  Center(child: Text('Shake your phone!',style: AppStyles.font20Blue,)),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

import 'package:sensors_plus/sensors_plus.dart';

class SensorMobile extends StatefulWidget {
  const SensorMobile({super.key});

  @override
  State<SensorMobile> createState() => _SensorMobileState();
}

class _SensorMobileState extends State<SensorMobile> {

static const double _shakeThreshold = 20.0; // Adjust for sensitivity
  static const Duration _shakeInterval = Duration(milliseconds: 300); // Time between shakes
  DateTime? _lastShakeTime;

@override
  void initState() {
    super.initState();
    // Listen to accelerometer events
    accelerometerEventStream().listen((AccelerometerEvent event) {
      // Calculate the magnitude of acceleration
      final double magnitude = sqrt(event.x * event.x + event.y * event.y + event.z * event.z);
      final now = DateTime.now();

      // Check if the magnitude exceeds the threshold and enough time has passed
      if (magnitude > _shakeThreshold &&
          (_lastShakeTime == null ||
              now.difference(_lastShakeTime!) > _shakeInterval)) {
        _lastShakeTime = now;
        // Trigger shake event
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Shake detected!')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Shake your phone!'),
    );
  }

  @override
  void dispose() {
    // Note: accelerometerEvents is a broadcast stream, so it doesn't require explicit disposal
    super.dispose();
  }
}
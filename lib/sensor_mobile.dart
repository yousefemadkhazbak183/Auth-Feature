// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:sensors_plus/sensors_plus.dart';
//
// class SensorMobile extends StatefulWidget {
//   const SensorMobile({super.key});
//
//   @override
//   State<SensorMobile> createState() => _SensorMobileState();
// }
//
// class _SensorMobileState extends State<SensorMobile> {
//
//   DeviceOrientation _lastOrientation = DeviceOrientation.portraitUp;
//
//   @override
//   void initState() {
//     super.initState();
//
//     SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     final Stream<DeviceOrientation> sensorStreams = accelerometerEventStream()
//         .map<DeviceOrientation>(_getOrientation)
//         .distinct();
//     return Scaffold(
//       body: StreamBuilder(
//         stream: sensorStreams,
//         initialData: _lastOrientation,
//         builder: (context, snapshot) {
//           return Center(child: Text(snapshot.data!.name));
//         },
//       ),
//     );
//   }
//   DeviceOrientation _getOrientation(AccelerometerEvent event) {
//     final x = event.x.abs();
//     final y = event.y.abs();
//     final z = event.z.abs();
//
//     if (z > x && z > y) {
//       return _lastOrientation;
//     }
//     if (x > y) {
//       _lastOrientation = event.x > 0
//           ? DeviceOrientation.landscapeLeft
//           : DeviceOrientation.landscapeRight;
//     } else {
//       _lastOrientation = DeviceOrientation.portraitUp;
//     }
//     return _lastOrientation;
//
//   }
// }

import 'package:auth_feature/core/routing/app_router.dart';
import 'package:auth_feature/core/routing/routers.dart';
import 'package:auth_feature/sensor_mobile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shake_gesture/shake_gesture.dart';
import 'package:requests_inspector/requests_inspector.dart';

import 'firebase_options.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  void myCallback() {}

  ShakeGesture.registerCallback(onShake: myCallback);
  ShakeGesture.unregisterCallback(onShake: myCallback);
  
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SensorMobile();
  runApp(RequestsInspector(child: MyApp(appRouter: AppRouter(),
  
  ),
  navigatorKey: navigatorKey,
  
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routers.signUpRouter,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }


  
}

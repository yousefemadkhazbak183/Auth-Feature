import 'package:auth_feature/feature/sign_out/sign_out_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/theming/app_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(

              children: [
                Center(
                  child: Text(
                    'Never Give Up !!!!!!!!!!!!!! ',
                    style: AppStyles.font20Blue,
                  ),
                ),
                SizedBox(height: 18.h,),
                const SignOutScreen(),
              ],
            ),
          ),
        ],

      ),
    );
  }
}
import 'package:auth_feature/core/theming/app_styles.dart';
import 'package:auth_feature/feature/sign_out/cubit/sign_out_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignOutScreen extends StatelessWidget {
  const SignOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignOutCubit(),
      child: BlocListener<SignOutCubit, SignOutState>(
        listener: (context, state) {
          if (state is SignOutSuccessState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('LogOut Success')));
            Navigator.pop(context);
          }
        },
        child: BlocBuilder<SignOutCubit, SignOutState>(
          builder: (context, state) {
            if (state is SignOutErrorState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
            return ElevatedButton(
              style: AppStyles.elevatedButtonSignOut,
              onPressed: () {
                context.read<SignOutCubit>().signOut();
              },
              child: const Text('Sign Out'),
            );
          },
        ),
      ),
    );
  }
}

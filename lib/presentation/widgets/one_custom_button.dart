import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_auth_app_homework/bloc/auth_bloc.dart';
import 'package:flutter_phone_auth_app_homework/presentation/fonts/app_fonts.dart';
import 'package:flutter_phone_auth_app_homework/presentation/screens/code_screen.dart';

class CustomButtonWidgetOne extends StatelessWidget {
  const CustomButtonWidgetOne({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        BlocProvider.of<AuthBloc>(context).add(
          SendPhoneNumberEvent(
            phoneNumber: controller.text,
          ),
        );
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(0.2),
        fixedSize: const Size(121, 54),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        side: const BorderSide(
          color: Colors.transparent,
        ),
      ),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(
                  state.errorText,
                  style: const TextStyle(
                    fontSize: 33,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            );
          } else if (state is AuthSuccess) {
            if (state.tokenModel.status == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CodeScreen(),
                ),
              );
            } else {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Text(
                    state.tokenModel.message ?? '',
                    style: const TextStyle(
                      fontSize: 33,
                    ),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                      ),
                    ),
                  ],
                ),
              );
            }
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const CircularProgressIndicator.adaptive();
          }
          return const Text(
            'Sign In',
            style: AppFonts.s15w600,
          );
        },
      ),
    );
  }
}

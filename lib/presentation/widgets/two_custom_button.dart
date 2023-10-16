import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_auth_app_homework/bloc/auth_bloc.dart';
import 'package:flutter_phone_auth_app_homework/presentation/fonts/app_fonts.dart';

class CustomButtonWidgetTwo extends StatelessWidget {
  const CustomButtonWidgetTwo({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        BlocProvider.of<AuthBloc>(context).add(
          SendReceivedCodeEvent(
            code: controller.text,
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
          if (state is AuthSuccessCode) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(
                  state.errorModel.message.toString(),
                  style: const TextStyle(fontSize: 23),
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
          } else if (state is AuthErrorCode) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(state.errorText),
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
          }
        },
        builder: (context, state) {
          if (state is AuthLoadingCode) {
            return const RefreshProgressIndicator();
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

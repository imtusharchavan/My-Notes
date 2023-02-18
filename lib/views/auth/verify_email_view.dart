import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/services/auth/auth_service.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Text('We have sent an email to tusharrchavan014@gmail.com'),
            const SizedBox(height: 10),
            const Text('You need to verify your email to continue.'),
            const Text(
                'If you have not received the verification email, please check your "Spam" or "Bulk Email" folder. You can also click the resend button below to have another email sent to you.'),
            const SizedBox(height: 25),
            TextButton(
              onPressed: () async {
                AuthService.firebase().sendEmailVerification();
              },
              child: const Text('Resend verification Email'),
            ),
            TextButton(
              onPressed: () async {
                await AuthService.firebase().logOut();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  registerRoute,
                  (route) => false,
                );
              },
              child: const Text('Restart'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:eye_care/Features/Registration/sign_up/UI/widgets/sign_up_body.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SignUpBody(),
    );
  }
}

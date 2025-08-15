import 'package:flutter/material.dart';
import 'package:online_learning_design/generated/l10n.dart';

class ForgetPasswordLink extends StatelessWidget {
  const ForgetPasswordLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(S.of(context).forgotpasswordclicked)),
          );
        },
        child: Text(
          S.of(context).forgetpassword,
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}

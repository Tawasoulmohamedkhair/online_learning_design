import 'package:flutter/material.dart';

class AuthLink extends StatelessWidget {
  const AuthLink({super.key, this.text, this.text1, this.onTap});
  final String? text;
  final String? text1;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text ?? '', style: TextStyle(color: Colors.grey)),
        InkWell(
          onTap: onTap,
          child: Text(
            text1 ?? '',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

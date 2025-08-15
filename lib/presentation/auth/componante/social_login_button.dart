import 'package:flutter/material.dart';
import 'package:online_learning_design/core/components/custom_svg_picture.dart';
import 'package:online_learning_design/generated/l10n.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(S.of(context).googleloginclicked)),
            );
          },
          child: CustomSvgPicture(svgAssetPath: 'assets/svg/google.svg'),
        ),
        const SizedBox(width: 24),
        InkWell(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(S.of(context).facebookloginclicked)),
            );
          },
          child: CustomSvgPicture(svgAssetPath: 'assets/svg/facebook.svg'),
        ),
      ],
    );
  }
}

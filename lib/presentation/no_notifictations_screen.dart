import 'package:flutter/material.dart';
import 'package:online_learning_design/core/components/custom_svg_picture.dart';
import 'package:online_learning_design/generated/l10n.dart';

class NoNotifictationsScreen extends StatelessWidget {
  const NoNotifictationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomSvgPicture(svgAssetPath: 'assets/svg/No notifcations.svg'),
            SizedBox(height: 19),

            Text(
              S.of(context).noNotifictationsyet,
              style: TextStyle(
                color: Color(0xff1F1F39),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 24),
            Text(
              S.of(context).Wellnotifyyouoncewehavesomethingforyou,
              style: TextStyle(
                color: Color(0xff1F1F39),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

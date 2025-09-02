import 'package:flutter/material.dart';
import 'package:online_learning_design/core/components/custom_elevated_button.dart';
import 'package:online_learning_design/core/components/custom_svg_picture.dart';
import 'package:online_learning_design/generated/l10n.dart';

class NoNetworkScreen extends StatelessWidget {
  const NoNetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {}),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomSvgPicture(svgAssetPath: 'assets/svg/nonetwork.svg'),
            SizedBox(height: 19),
            Text(
              S.of(context).NoNetwork,
              style: TextStyle(
                color: Color(0xff1F1F39),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),

            Text(
              S.of(context).checkyourinternetconnection,
              style: TextStyle(
                color: Color(0xff1F1F39),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 24),
            CustomElevatedButton(
              width: 327,
              backgroundColor: Color(0xff3D5CFF),
              onPressed: () {},
              label: Text(
                S.of(context).tryagain,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

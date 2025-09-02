import 'package:flutter/material.dart';
import 'package:online_learning_design/core/components/custom_svg_picture.dart';

class PayNowScreen extends StatelessWidget {
  const PayNowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [CustomSvgPicture(svgAssetPath: 'assets/svg/Fill.svg')],
      ),
    );
  }
}

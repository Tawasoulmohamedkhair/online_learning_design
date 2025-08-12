import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvgPicture extends StatelessWidget {
  const CustomSvgPicture({
    super.key,
    required this.svgAssetPath,
    this.width,
    this.height,
    this.withcolorfilter = true,
  });
  const CustomSvgPicture.withcolorfilter({
    super.key,
    required this.svgAssetPath,
    this.width,
    this.height,
  }) : withcolorfilter = false;
  final String svgAssetPath;
  final double? width;
  final double? height;
  final bool withcolorfilter;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgAssetPath,
      width: width,
      height: height,
      colorFilter:
          withcolorfilter
              ? const ColorFilter.mode(Color(0xff1F1F39), BlendMode.srcIn)
              : null,
    );
  }
}

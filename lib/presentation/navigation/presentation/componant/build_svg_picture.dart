import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BuildSvgPicture extends StatelessWidget {
  const BuildSvgPicture({
    super.key,
    required this.svgAssetPath,
    required this.index,
  });
  final String svgAssetPath;
  final int index;
  final int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgAssetPath,
      colorFilter: ColorFilter.mode(
        currentindex == index
            ? const Color(0xFF3D5CFF)
            : const Color(0xffC6C6C6),
        BlendMode.srcIn,
      ),
    );
  }
}

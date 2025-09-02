import 'package:flutter/material.dart';
import 'package:online_learning_design/presentation/navigation/presentation/componant/build_svg_picture.dart';

class BuildNavItem extends StatelessWidget {
  const BuildNavItem({
    super.key,
    required this.svgAssetPath,
    required this.label,
    required this.index,
    required this.selected,
    required this.onTap,
  });

  final String svgAssetPath;
  final String label;
  final int index;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BuildSvgPicture(svgAssetPath: svgAssetPath, index: index),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  color:
                      selected
                          ? const Color(0xFF3D5CFF)
                          : const Color(0xffC6C6C6),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

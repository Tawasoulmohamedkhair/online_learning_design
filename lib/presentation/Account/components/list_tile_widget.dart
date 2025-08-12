import 'package:flutter/material.dart';
import 'package:online_learning_design/core/components/custom_svg_picture.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    this.onTap,
    required this.svgAssetPath,
    required this.title,
    this.iconData,
    this.switchWidget,
    this.height,
    this.width,
  });
  final Function()? onTap;
  final String svgAssetPath;
  final String title;
  final IconData? iconData;
  final Switch? switchWidget;
  final int? height;
  final int? width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListTile(
        onTap: onTap,

        contentPadding: EdgeInsets.all(0),

        title: Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.displayMedium!.copyWith(fontSize: 16),
        ),
        iconColor: Color(0xff1F1F39),
        trailing: CustomSvgPicture(svgAssetPath: svgAssetPath,
        
        ),
      ),
    );
  }
}

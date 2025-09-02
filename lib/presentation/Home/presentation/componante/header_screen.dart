import 'package:flutter/material.dart';
import 'package:online_learning_design/core/components/custom_svg_picture.dart';
import 'package:online_learning_design/generated/l10n.dart';
import 'package:online_learning_design/presentation/Home/domin/entities/user_entity.dart';

class HeaderScreen extends StatelessWidget {
  const HeaderScreen({required this.user, super.key});
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 183,
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF5560FB), Color(0xFF8692F9)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).hiUser(user.name),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                S.of(context).letsstartlearning,
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
            ],
          ),
          CustomSvgPicture(
            svgAssetPath: user.profileImageUrl,
            width: 36,
            height: 50,
          ),
        ],
      ),
    );
  }
}

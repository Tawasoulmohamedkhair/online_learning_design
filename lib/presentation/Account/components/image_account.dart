import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageAccount extends StatelessWidget {
  const ImageAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.transparent,
                child: SvgPicture.asset(
                  width: 64,
                  height: 89,
                  'assets/svg/Avatar.svg',
                ),
              ),
              GestureDetector(
                onTap: () async {},
                child: SvgPicture.asset(
                  'assets/svg/Icon.svg',
                  fit: BoxFit.contain,
                  placeholderBuilder:
                      (context) => const Icon(Icons.error),
                  width: 30,
                  height: 30,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
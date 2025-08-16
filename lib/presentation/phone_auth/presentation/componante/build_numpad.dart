import 'package:flutter/material.dart';

class BuildNumpad extends StatelessWidget {
  const BuildNumpad({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneNumberController = TextEditingController();

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      children: List.generate(12, (index) {
        if (index == 10) {
          return const SizedBox();
        } else if (index == 9) {
          return InkWell(
            onTap: () {
              phoneNumberController.text += '0';
            },
            child: const Center(
              child: Text(
                '0',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          );
        } else if (index == 11) {
          return IconButton(
            icon: const Icon(Icons.backspace),
            onPressed: () {
              if (phoneNumberController.text.isNotEmpty) {
                phoneNumberController.text = phoneNumberController.text
                    .substring(0, phoneNumberController.text.length - 1);
              }
            },
          );
        } else {
          final number = index + 1;
          return InkWell(
            onTap: () {
              phoneNumberController.text += number.toString();
            },
            child: Center(
              child: Text(
                number.toString(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:online_learning_design/generated/l10n.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [Text(S.of(context).course)]);
  }
}

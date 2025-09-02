import 'package:flutter/material.dart';
import 'package:online_learning_design/generated/l10n.dart';

class TermsCheckBox extends StatefulWidget {
  final ValueChanged<bool> onChecked;

  const TermsCheckBox({super.key, required this.onChecked});

  @override
  State<TermsCheckBox> createState() => _TermsCheckBoxState();
}

class _TermsCheckBoxState extends State<TermsCheckBox> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: (bool? newValue) {
            setState(() {
              _isChecked = newValue!;
            });
            widget.onChecked(newValue!);
          },
        ),
        Text(
          S.of(context).bycreatinganaccountyouhavetoagreewithourthemcondication,
        ),
      ],
    );
  }
}

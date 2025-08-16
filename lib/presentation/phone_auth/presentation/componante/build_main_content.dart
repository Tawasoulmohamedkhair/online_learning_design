import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_design/generated/l10n.dart';
import 'package:online_learning_design/presentation/phone_auth/presentation/PhoneAuthBloc/phone_auth_bloc_bloc.dart';
import 'package:online_learning_design/presentation/phone_auth/presentation/PhoneAuthBloc/phone_auth_bloc_event.dart';
import 'package:online_learning_design/presentation/phone_auth/presentation/PhoneAuthBloc/phone_auth_bloc_state.dart';
import 'package:online_learning_design/presentation/phone_auth/presentation/componante/build_numpad.dart';

class BuildMainContent extends StatefulWidget {
  const BuildMainContent({super.key});

  @override
  State<BuildMainContent> createState() => _BuildMainContentState();
}

class _BuildMainContentState extends State<BuildMainContent> {
  @override
  Widget build(BuildContext context) {
    PhoneAuthState state = context.watch<PhoneAuthBloc>().state;

    return SafeArea(
      child: Container(
        width: 375,
        height: 540,
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          children: [
            Text(
              S.of(context).enterYourPhoneNumber,
              style: TextStyle(fontSize: 16),
            ),

            Row(
              children: [
                const Text(
                  '+63 283 835 2999',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed:
                      state is! PhoneAuthLoading ? _submitPhoneNumber : null,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(S.of(context).continues),
                ),
              ],
            ),
            BuildNumpad(),
          ],
        ),
      ),
    );
  }

  void _submitPhoneNumber() {
    final phoneNumberController = TextEditingController();

    final phoneNumber = phoneNumberController.text;
    BlocProvider.of<PhoneAuthBloc>(
      context,
    ).add(PhoneNumberSubmitted(phoneNumber));
  }
}

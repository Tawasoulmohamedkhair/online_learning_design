import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:online_learning_design/generated/l10n.dart';
import 'package:online_learning_design/presentation/phone_auth/presentation/PhoneAuthBloc/phone_auth_bloc_bloc.dart';
import 'package:online_learning_design/presentation/phone_auth/presentation/PhoneAuthBloc/phone_auth_bloc_event.dart';
import 'package:online_learning_design/presentation/phone_auth/presentation/PhoneAuthBloc/phone_auth_bloc_state.dart';

class BuildMainContent extends StatefulWidget {
  const BuildMainContent({super.key});

  @override
  State<BuildMainContent> createState() => _BuildMainContentState();
}

class _BuildMainContentState extends State<BuildMainContent> {
  final TextEditingController phoneController = TextEditingController();
  String phoneCompleteNumber = '';

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        //height: 540,
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).enterYourPhoneNumber,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: IntlPhoneField(
                    controller: phoneController,

                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(borderSide: BorderSide()),
                    ),
                    initialCountryCode: 'EN',
                    onChanged: (phone) {
                      phoneCompleteNumber = phone.completeNumber;
                    },
                  ),
                ),
            
              const SizedBox(width: 10),
              BlocBuilder<PhoneAuthBloc, PhoneAuthState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed:
                          state is! PhoneAuthLoading
                              ? () => context.read<PhoneAuthBloc>().add(
                                PhoneNumberSubmitted(phoneCompleteNumber),
                              )
                              : null,

                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child:
                          state is PhoneAuthLoading
                              ? const CircularProgressIndicator()
                              : Text(S.of(context).continues),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

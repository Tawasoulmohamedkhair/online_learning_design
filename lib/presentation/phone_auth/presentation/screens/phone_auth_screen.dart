import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_learning_design/generated/l10n.dart';
import 'package:online_learning_design/presentation/phone_auth/presentation/PhoneAuthBloc/phone_auth_bloc_bloc.dart';
import 'package:online_learning_design/presentation/phone_auth/presentation/PhoneAuthBloc/phone_auth_bloc_state.dart';
import 'package:online_learning_design/presentation/phone_auth/presentation/componante/build_main_content.dart';
import 'package:online_learning_design/presentation/phone_auth/presentation/screens/otp_screen.dart';

class PhoneAuthScreen extends StatelessWidget {
  const PhoneAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F0F2),
      appBar: AppBar(
        backgroundColor: const Color(0xffF0F0F2),
        title: Text(
          S.of(context).continuewithPhone,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocListener<PhoneAuthBloc, PhoneAuthState>(
        listener: (context, state) {
          if (state is PhoneAuthCodeSent) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) => OtpScreen(
                        phoneNumber: state.phoneNumber,
                        verificationId: state.verificationId,
                      ),
                ),
              );
            });
          } else if (state is PhoneAuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: 124,
                height: 124,
                decoration: BoxDecoration(
                  color: Color(0xffC4C4C4),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  'assets/svg/easy.svg',
                  width: 100,
                  height: 100,
                ),
              ),
              SizedBox(height: 45),
              const BuildMainContent(),
            ],
          ),
        ),
      ),
    );
  }
}

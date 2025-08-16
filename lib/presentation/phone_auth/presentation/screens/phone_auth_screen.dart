import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_learning_design/generated/l10n.dart';
import 'package:online_learning_design/presentation/phone_auth/presentation/PhoneAuthBloc/phone_auth_bloc_bloc.dart';
import 'package:online_learning_design/presentation/phone_auth/presentation/PhoneAuthBloc/phone_auth_bloc_state.dart';
import 'package:online_learning_design/presentation/phone_auth/presentation/componante/build_main_content.dart';
import 'package:online_learning_design/presentation/phone_auth/presentation/screens/success_screen.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF0F0F2),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed:
              () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SuccessScreen()),
              ),
        ),
        title: Text(
          S.of(context).continuewithPhone,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffF0F0F2),
      body: BlocConsumer<PhoneAuthBloc, PhoneAuthState>(
        listener: (context, state) {
          if (state is PhoneAuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Verification code sent!')),
            );
          } else if (state is PhoneAuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
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
                SizedBox(height: 40),

                BuildMainContent(),
              ],
            ),
          );
        },
      ),
    );
  }
}

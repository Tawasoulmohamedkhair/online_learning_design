// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:online_learning_design/generated/l10n.dart';
// import 'package:online_learning_design/presentation/Language/Localizationbloc/localization_bloc.dart';
// import 'package:online_learning_design/presentation/Onboarding/onboarding_screen.dart';
// import 'package:online_learning_design/presentation/auth/authbloc/auth_bloc.dart';
// import 'package:online_learning_design/presentation/auth/data/repositry/auth_repository.dart';
// import 'package:online_learning_design/presentation/auth/domin/usecase/login_use_case.dart';
// import 'package:online_learning_design/presentation/auth/domin/usecase/sign_up_usecase.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<AuthBloc>(
//           create:
//               (context) => AuthBloc(
//                 signUpUseCase: SignUpUseCase(
//                   authRepository: AuthRepositoryImpl(),
//                 ),
//                 loginUseCase: LoginUseCase(
//                   authRepository: AuthRepositoryImpl(),
//                 ),
//               ),
//         ),
//         BlocProvider<LocalizationBloc>(create: (context) => LocalizationBloc()),
//       ],
//       child: BlocBuilder<LocalizationBloc, LocalizationState>(
//         builder: (context, state) {
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             title: 'Online Learning App',
//             localizationsDelegates: const [
//               S.delegate,
//               GlobalMaterialLocalizations.delegate,
//               GlobalWidgetsLocalizations.delegate,
//               GlobalCupertinoLocalizations.delegate,
//             ],
//             supportedLocales: S.delegate.supportedLocales,
//             locale: state.locale,
//             theme: ThemeData(
//               colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//               useMaterial3: true,
//             ),
//             home: OnboardingScreen(),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:online_learning_design/core/utils/network_info.dart';
import 'package:online_learning_design/generated/l10n.dart';
import 'package:online_learning_design/presentation/Language/Localizationbloc/localization_bloc.dart';
import 'package:online_learning_design/presentation/Onboarding/onboarding_screen.dart';
import 'package:online_learning_design/presentation/auth/authbloc/auth_bloc.dart';
import 'package:online_learning_design/presentation/auth/data/repositry/auth_repository.dart';
import 'package:online_learning_design/presentation/auth/domin/usecase/login_use_case.dart';
import 'package:online_learning_design/presentation/auth/domin/usecase/sign_up_usecase.dart';
import 'package:online_learning_design/presentation/phone_auth/data/datasources/remote_data_source.dart';
import 'package:online_learning_design/presentation/phone_auth/data/repositories/phone_auth_repository_impl.dart';

// Import the new classes for PhoneAuth

import 'package:online_learning_design/presentation/phone_auth/domin/usecases/submit_phone_number.dart';
import 'package:online_learning_design/presentation/phone_auth/presentation/PhoneAuthBloc/phone_auth_bloc_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create:
              (context) => AuthBloc(
                signUpUseCase: SignUpUseCase(
                  authRepository: AuthRepositoryImpl(),
                ),
                loginUseCase: LoginUseCase(
                  authRepository: AuthRepositoryImpl(),
                ),
              ),
        ),
        BlocProvider<LocalizationBloc>(create: (context) => LocalizationBloc()),
        // Add the new BlocProvider for PhoneAuthBloc
        BlocProvider<PhoneAuthBloc>(
          create:
              (context) => PhoneAuthBloc(
                submitPhoneNumber: SubmitPhoneNumber(
                  PhoneAuthRepositoryImpl(
                    remoteDataSource: PhoneAuthRemoteDataSourceImpl(),
                    networkInfo: NetworkInfoImpl(
                      InternetConnectionChecker.instance,
                    ),
                  ),
                ),
              ),
        ),
      ],
      child: BlocBuilder<LocalizationBloc, LocalizationState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Online Learning App',
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: state.locale,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: OnboardingScreen(),
          );
        },
      ),
    );
  }
}

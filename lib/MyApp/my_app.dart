import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:online_learning_design/generated/l10n.dart';
import 'package:online_learning_design/presentation/Language/Localizationbloc/localization_bloc.dart';
import 'package:online_learning_design/presentation/Onboarding/onboarding_screen.dart';
import 'package:online_learning_design/presentation/auth/authbloc/auth_bloc.dart';
import 'package:online_learning_design/presentation/auth/data/repositry/auth_repository.dart';
import 'package:online_learning_design/presentation/auth/domin/usecase/login_use_case.dart';
import 'package:online_learning_design/presentation/auth/domin/usecase/sign_up_usecase.dart';

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

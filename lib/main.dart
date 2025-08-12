import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:online_learning_design/generated/l10n.dart';
import 'package:online_learning_design/presentation/Language/Localizationbloc/localization_bloc.dart';
import 'package:online_learning_design/presentation/Language/Localizationbloc/localization_event.dart';
import 'package:online_learning_design/presentation/Onboarding/onboarding_screen.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => LocalizationBloc()..add(LoadSavedLocalization()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationBloc, LocalizationState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Online Learning App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: state.locale,
          home: OnboardingScreen(),
        );
      },
    );
  }
}

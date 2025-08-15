import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_design/generated/l10n.dart';
import 'package:online_learning_design/presentation/Language/Localizationbloc/localization_bloc.dart';
import 'package:online_learning_design/presentation/Account/components/image_account.dart';
import 'package:online_learning_design/presentation/Account/components/list_tile_widget.dart';
import 'package:online_learning_design/presentation/Language/language_screen.dart';
import 'package:online_learning_design/presentation/Onboarding/onboarding_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OnboardingScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Text(
                    S.of(context).account,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  IconButton(
                    onPressed: () async {
                      final newLocale = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LanguageScreen(),
                        ),
                      );
                      if (newLocale != null && newLocale is Locale) {
                        context.read<LocalizationBloc>().add(
                          ChangeLocale(newLocale),
                        );
                      }
                    },
                    icon: const Icon(Icons.language, color: Colors.black),
                  ),
                ],
              ),
            ),
            ImageAccount(),
            ListTileWidget(
              svgAssetPath: 'assets/svg/stroke.svg',

              onTap: () async {},
              title: S.of(context).favourite,
            ),
            ListTileWidget(
              onTap: () {},
              svgAssetPath: 'assets/svg/stroke.svg',
              title: S.of(context).editAccount,
            ),
            ListTileWidget(
              onTap: () {},
              svgAssetPath: 'assets/svg/stroke.svg',
              title: S.of(context).settingsandPrivacy,
            ),
            ListTileWidget(
              svgAssetPath: 'assets/svg/stroke.svg',
              title: S.of(context).help,
            ),
          ],
        ),
      ),
    );
  }
}

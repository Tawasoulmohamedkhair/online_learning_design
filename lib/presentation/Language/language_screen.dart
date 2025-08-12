import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_design/generated/l10n.dart';
import 'package:online_learning_design/presentation/Language/Localizationbloc/localization_bloc.dart';
import 'package:online_learning_design/presentation/Language/Localizationbloc/localization_event.dart';
import 'package:online_learning_design/presentation/Language/data/language_model.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationBloc, LocalizationState>(
      builder: (context, state) {
        // Current selected language code
        var groupValue = state.locale.languageCode;

        return Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).language),
            centerTitle: true,
          ),
          body: ListView.builder(
            itemCount: languagesModel.length,
            itemBuilder: (context, index) {
              var item = languagesModel[index];
              return RadioListTile<String>(
                value: item.languageCode,
                groupValue: groupValue,
                title: Text(
                  item.languageName,
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
                subtitle: Text(item.subLanguage),
                onChanged: (value) {
                  if (value != null) {
                    BlocProvider.of<LocalizationBloc>(
                      context,
                    ).add(ChangeLocalization(item.locale, locale: item.locale));
                    Navigator.of(context).pop();
                  }
                },
              );
            },
          ),
        );
      },
    );
  }
}

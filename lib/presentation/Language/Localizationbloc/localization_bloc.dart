import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_design/presentation/Language/Localizationbloc/localization_event.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  static const _localeKey = 'locale_language_code';

  LocalizationBloc() : super(LocalizationState(const Locale('en'))) {
    on<ChangeLocalization>(_onChangeLocalization);
    on<LoadSavedLocalization>(_onLoadSavedLocalization);
  }
  Future<void> _onChangeLocalization(
    ChangeLocalization event,
    Emitter<LocalizationState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, event.newLocale.languageCode);

    emit(LocalizationState(event.newLocale));
  }

  Future<void> _onLoadSavedLocalization(
    LoadSavedLocalization event,
    Emitter<LocalizationState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final savedLanguageCode = prefs.getString(_localeKey);

    Locale initialLocale;
    if (savedLanguageCode != null) {
      initialLocale = Locale(savedLanguageCode);
    } else {
      initialLocale = const Locale('en');
    }

    emit(LocalizationState(initialLocale));
  }
}

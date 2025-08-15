import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:online_learning_design/generated/l10n.dart';

part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  // Key for storing the locale in SharedPreferences
  static const _localeKey = 'locale';

  LocalizationBloc()
    : super(LocalizationState(S.delegate.supportedLocales.first)) {
    on<ChangeLocale>(_onChangeLocale);
    _loadLocale();
  }

  // Asynchronously load the saved locale from SharedPreferences
  Future<void> _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final String? languageCode = prefs.getString(_localeKey);
    if (languageCode != null) {
      add(ChangeLocale(Locale(languageCode)));
    }
  }

  Future<void> _onChangeLocale(
    ChangeLocale event,
    Emitter<LocalizationState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, event.locale.languageCode);
    emit(LocalizationState(event.locale));
  }
}

class ChangeLocale extends LocalizationEvent {
  final Locale locale;
  const ChangeLocale(this.locale);
}

abstract class LocalizationEvent {
  const LocalizationEvent();
}

class LocalizationState {
  final Locale locale;
  const LocalizationState(this.locale);
}

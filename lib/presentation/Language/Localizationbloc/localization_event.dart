import 'dart:ui';

abstract class LocalizationEvent {}

class LoadSavedLocalization extends LocalizationEvent {}

class ChangeLocalization extends LocalizationEvent {
  final Locale newLocale;
  ChangeLocalization(this.newLocale, {required Locale locale});
}

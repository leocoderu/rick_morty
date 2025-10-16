// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get language => 'English';

  @override
  String get home_title => 'Rick & Morty';

  @override
  String get home_text => 'Tap the buttons below to change the counter';

  @override
  String get home_btInc_tooltip => 'Increase';

  @override
  String get home_btDec_tooltip => 'Decrease';

  @override
  String get settings_title => 'Settings';

  @override
  String get settings_swSystemTheme_title => 'System theme';

  @override
  String get settings_swSystemTheme_subtitle => 'On / Off System theme';

  @override
  String get settings_swDarkTheme_title => 'Dark theme';

  @override
  String get settings_swDarkTheme_subtitle => 'On / Off Dark theme';
}

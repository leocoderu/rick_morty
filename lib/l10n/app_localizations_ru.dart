// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get language => 'Русский';

  @override
  String get home_title => 'Рик и Морти';

  @override
  String get home_text => 'Нажимайте кнопки внизу для изменения счетчика';

  @override
  String get home_btInc_tooltip => 'Увеличить';

  @override
  String get home_btDec_tooltip => 'Уменьшить';

  @override
  String get settings_title => 'Настройки';

  @override
  String get settings_swSystemTheme_title => 'Системная тема';

  @override
  String get settings_swSystemTheme_subtitle => 'Вкл / Выкл Системной темы';

  @override
  String get settings_swDarkTheme_title => 'Тёмная тема';

  @override
  String get settings_swDarkTheme_subtitle => 'Вкл / Выкл Тёмной темы';
}

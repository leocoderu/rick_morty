// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get language => 'عرب';

  @override
  String get home_title => 'ريك ومورتي';

  @override
  String get home_text => 'اضغط على الأزرار أدناه لتغيير العداد';

  @override
  String get home_btInc_tooltip => 'الزيادة';

  @override
  String get home_btDec_tooltip => 'النقصان';

  @override
  String get settings_title => 'إعدادات';

  @override
  String get settings_swSystemTheme_title => 'موضوع النظام';

  @override
  String get settings_swSystemTheme_subtitle => 'تشغيل / إيقاف موضوع النظام';

  @override
  String get settings_swDarkTheme_title => 'موضوع الظلام';

  @override
  String get settings_swDarkTheme_subtitle => 'تشغيل / إيقاف موضوع الظلام';
}

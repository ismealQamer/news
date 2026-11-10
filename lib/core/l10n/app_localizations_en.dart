// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'APP Name';

  @override
  String get nameRequired => 'Name is required';

  @override
  String get invalidNameFormat => 'Please enter a valid name';

  @override
  String get emailRequired => 'Email is required';

  @override
  String get invalidEmailFormat => 'Please enter a valid email address';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get passwordInvalid =>
      'Password must be at least 8 characters, include uppercase, lowercase, a number, and a special character';

  @override
  String get confirmPasswordRequired => 'Please confirm your password';

  @override
  String get passwordConfirmationMismatch => 'Passwords do not match';
}

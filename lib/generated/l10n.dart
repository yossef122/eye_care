// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Email`
  String get Email_form_field {
    return Intl.message(
      'Email',
      name: 'Email_form_field',
      desc: '',
      args: [],
    );
  }

  /// `mohamedtamer25@gmail.com`
  String get Email_validator_form_field {
    return Intl.message(
      'mohamedtamer25@gmail.com',
      name: 'Email_validator_form_field',
      desc: '',
      args: [],
    );
  }

  /// `mohamedtamer25@gmail.com`
  String get Email_hint_form_field {
    return Intl.message(
      'mohamedtamer25@gmail.com',
      name: 'Email_hint_form_field',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get Name_form_field {
    return Intl.message(
      'Name',
      name: 'Name_form_field',
      desc: '',
      args: [],
    );
  }

  /// `mohamedtamer25@gmail.com`
  String get Name_validator_form_field {
    return Intl.message(
      'mohamedtamer25@gmail.com',
      name: 'Name_validator_form_field',
      desc: '',
      args: [],
    );
  }

  /// `mohamed tamer`
  String get Name_hint_form_field {
    return Intl.message(
      'mohamed tamer',
      name: 'Name_hint_form_field',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password_form_field {
    return Intl.message(
      'Password',
      name: 'Password_form_field',
      desc: '',
      args: [],
    );
  }

  /// `**********`
  String get Password_hint_form_field {
    return Intl.message(
      '**********',
      name: 'Password_hint_form_field',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password_validator_form_field {
    return Intl.message(
      'Password',
      name: 'Password_validator_form_field',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get Login_button {
    return Intl.message(
      'Login',
      name: 'Login_button',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get SignUp_button {
    return Intl.message(
      'Sign Up',
      name: 'SignUp_button',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Google`
  String get google_register_button {
    return Intl.message(
      'Continue with Google',
      name: 'google_register_button',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

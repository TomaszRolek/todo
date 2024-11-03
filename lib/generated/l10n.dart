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

  /// `Użytkownicy`
  String get users {
    return Intl.message(
      'Użytkownicy',
      name: 'users',
      desc: '',
      args: [],
    );
  }

  /// `Wystąpił błąd`
  String get error_occured {
    return Intl.message(
      'Wystąpił błąd',
      name: 'error_occured',
      desc: '',
      args: [],
    );
  }

  /// `Dodaj zadanie`
  String get add_task {
    return Intl.message(
      'Dodaj zadanie',
      name: 'add_task',
      desc: '',
      args: [],
    );
  }

  /// `Nie udało się pobrać danych`
  String get api_error {
    return Intl.message(
      'Nie udało się pobrać danych',
      name: 'api_error',
      desc: '',
      args: [],
    );
  }

  /// `Anuluj`
  String get cancel {
    return Intl.message(
      'Anuluj',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Zaktualizowano status`
  String get edit_task_success {
    return Intl.message(
      'Zaktualizowano status',
      name: 'edit_task_success',
      desc: '',
      args: [],
    );
  }

  /// `Dodano zadanie`
  String get add_task_success {
    return Intl.message(
      'Dodano zadanie',
      name: 'add_task_success',
      desc: '',
      args: [],
    );
  }

  /// `Wystąpił błąd`
  String get edit_task_failure {
    return Intl.message(
      'Wystąpił błąd',
      name: 'edit_task_failure',
      desc: '',
      args: [],
    );
  }

  /// `Wystąpił błąd`
  String get add_task_failure {
    return Intl.message(
      'Wystąpił błąd',
      name: 'add_task_failure',
      desc: '',
      args: [],
    );
  }

  /// `Szczegóły użytkownika`
  String get user_details {
    return Intl.message(
      'Szczegóły użytkownika',
      name: 'user_details',
      desc: '',
      args: [],
    );
  }

  /// `Nie znaleziono szczegółów użytkownika`
  String get user_not_found {
    return Intl.message(
      'Nie znaleziono szczegółów użytkownika',
      name: 'user_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Zadania`
  String get tasks {
    return Intl.message(
      'Zadania',
      name: 'tasks',
      desc: '',
      args: [],
    );
  }

  /// `Zmień status`
  String get change_status {
    return Intl.message(
      'Zmień status',
      name: 'change_status',
      desc: '',
      args: [],
    );
  }

  /// `Dodaj`
  String get add {
    return Intl.message(
      'Dodaj',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Treść zadania`
  String get task_description {
    return Intl.message(
      'Treść zadania',
      name: 'task_description',
      desc: '',
      args: [],
    );
  }

  /// `Po dacie, malejąco`
  String get date_desc {
    return Intl.message(
      'Po dacie, malejąco',
      name: 'date_desc',
      desc: '',
      args: [],
    );
  }

  /// `Po dacie, rosnąco`
  String get date_asc {
    return Intl.message(
      'Po dacie, rosnąco',
      name: 'date_asc',
      desc: '',
      args: [],
    );
  }

  /// `Po nazwie, malejąco`
  String get name_desc {
    return Intl.message(
      'Po nazwie, malejąco',
      name: 'name_desc',
      desc: '',
      args: [],
    );
  }

  /// `Po nazwie, rosnąco`
  String get name_asc {
    return Intl.message(
      'Po nazwie, rosnąco',
      name: 'name_asc',
      desc: '',
      args: [],
    );
  }

  /// `Rozwiązane`
  String get resolved {
    return Intl.message(
      'Rozwiązane',
      name: 'resolved',
      desc: '',
      args: [],
    );
  }

  /// `Nierozwiązane`
  String get unresolved {
    return Intl.message(
      'Nierozwiązane',
      name: 'unresolved',
      desc: '',
      args: [],
    );
  }

  /// `resolved`
  String get resolved_en {
    return Intl.message(
      'resolved',
      name: 'resolved_en',
      desc: '',
      args: [],
    );
  }

  /// `unresolved`
  String get unresolved_en {
    return Intl.message(
      'unresolved',
      name: 'unresolved_en',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'pl', countryCode: 'PL'),
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

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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Team Directory`
  String get titleTeamDirectory {
    return Intl.message(
      'Team Directory',
      name: 'titleTeamDirectory',
      desc: '',
      args: [],
    );
  }

  /// `Data Not Found`
  String get ErrorDataNotFound {
    return Intl.message(
      'Data Not Found',
      name: 'ErrorDataNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Employee Name`
  String get lblEmployeeName {
    return Intl.message(
      'Employee Name',
      name: 'lblEmployeeName',
      desc: '',
      args: [],
    );
  }

  /// `Employee Age`
  String get lblEmployeeAge {
    return Intl.message(
      'Employee Age',
      name: 'lblEmployeeAge',
      desc: '',
      args: [],
    );
  }

  /// `Employee salary`
  String get lblEmployeeSalary {
    return Intl.message(
      'Employee salary',
      name: 'lblEmployeeSalary',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get lblAdd {
    return Intl.message('Add', name: 'lblAdd', desc: '', args: []);
  }

  /// `Update`
  String get lblUpdate {
    return Intl.message('Update', name: 'lblUpdate', desc: '', args: []);
  }

  /// `Add New Employee`
  String get headingAddNewEmployee {
    return Intl.message(
      'Add New Employee',
      name: 'headingAddNewEmployee',
      desc: '',
      args: [],
    );
  }

  /// `Edit Employee data`
  String get headlineEditEmployeeData {
    return Intl.message(
      'Edit Employee data',
      name: 'headlineEditEmployeeData',
      desc: '',
      args: [],
    );
  }

  /// `Do You really want to DELETE EMPLOYEE !!!`
  String get msmDoYouReallyWantToDeleteEmployee {
    return Intl.message(
      'Do You really want to DELETE EMPLOYEE !!!',
      name: 'msmDoYouReallyWantToDeleteEmployee',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
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

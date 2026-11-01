import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_strings_en.dart';
import 'app_strings_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppStrings
/// returned by `AppStrings.of(context)`.
///
/// Applications need to include `AppStrings.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_strings.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppStrings.localizationsDelegates,
///   supportedLocales: AppStrings.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppStrings.supportedLocales
/// property.
abstract class AppStrings {
  AppStrings(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppStrings of(BuildContext context) {
    return Localizations.of<AppStrings>(context, AppStrings)!;
  }

  static const LocalizationsDelegate<AppStrings> delegate =
      _AppStringsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In ru, this message translates to:
  /// **'Helpers VZ'**
  String get appTitle;

  /// No description provided for @homeTitle.
  ///
  /// In ru, this message translates to:
  /// **'Helpers VZ'**
  String get homeTitle;

  /// No description provided for @homeSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Каркас приложения готов'**
  String get homeSubtitle;

  /// No description provided for @homeMathSquareButton.
  ///
  /// In ru, this message translates to:
  /// **'Площадь фигур'**
  String get homeMathSquareButton;

  /// No description provided for @mathSquareTitle.
  ///
  /// In ru, this message translates to:
  /// **'Площадь фигуры'**
  String get mathSquareTitle;

  /// No description provided for @mathSquareShowAnswer.
  ///
  /// In ru, this message translates to:
  /// **'Показать ответ'**
  String get mathSquareShowAnswer;

  /// No description provided for @mathSquareNextQuestion.
  ///
  /// In ru, this message translates to:
  /// **'Следующий вопрос'**
  String get mathSquareNextQuestion;

  /// No description provided for @mathSquareAnswer.
  ///
  /// In ru, this message translates to:
  /// **'Ответ: {answer}'**
  String mathSquareAnswer(int answer);

  /// No description provided for @squareQuestion.
  ///
  /// In ru, this message translates to:
  /// **'Найдите площадь квадрата'**
  String get squareQuestion;

  /// No description provided for @rectangleQuestion.
  ///
  /// In ru, this message translates to:
  /// **'Найдите площадь прямоугольника'**
  String get rectangleQuestion;

  /// No description provided for @parallelogramQuestion.
  ///
  /// In ru, this message translates to:
  /// **'Найдите площадь параллелограмма'**
  String get parallelogramQuestion;

  /// No description provided for @triangleQuestion.
  ///
  /// In ru, this message translates to:
  /// **'Найдите площадь треугольника'**
  String get triangleQuestion;

  /// No description provided for @rightTriangleQuestion.
  ///
  /// In ru, this message translates to:
  /// **'Найдите площадь прямоугольного треугольника'**
  String get rightTriangleQuestion;

  /// No description provided for @rhombusQuestion.
  ///
  /// In ru, this message translates to:
  /// **'Найдите площадь ромба'**
  String get rhombusQuestion;

  /// No description provided for @trapezoidQuestion.
  ///
  /// In ru, this message translates to:
  /// **'Найдите площадь трапеции'**
  String get trapezoidQuestion;

  /// No description provided for @sideMeasurement.
  ///
  /// In ru, this message translates to:
  /// **'Сторона — {value}'**
  String sideMeasurement(int value);

  /// No description provided for @lengthMeasurement.
  ///
  /// In ru, this message translates to:
  /// **'Длина — {value}'**
  String lengthMeasurement(int value);

  /// No description provided for @widthMeasurement.
  ///
  /// In ru, this message translates to:
  /// **'Ширина — {value}'**
  String widthMeasurement(int value);

  /// No description provided for @baseMeasurement.
  ///
  /// In ru, this message translates to:
  /// **'Основание — {value}'**
  String baseMeasurement(int value);

  /// No description provided for @heightMeasurement.
  ///
  /// In ru, this message translates to:
  /// **'Высота — {value}'**
  String heightMeasurement(int value);

  /// No description provided for @legMeasurement.
  ///
  /// In ru, this message translates to:
  /// **'Катет — {value}'**
  String legMeasurement(int value);

  /// No description provided for @diagonalMeasurement.
  ///
  /// In ru, this message translates to:
  /// **'Диагональ — {value}'**
  String diagonalMeasurement(int value);
}

class _AppStringsDelegate extends LocalizationsDelegate<AppStrings> {
  const _AppStringsDelegate();

  @override
  Future<AppStrings> load(Locale locale) {
    return SynchronousFuture<AppStrings>(lookupAppStrings(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppStringsDelegate old) => false;
}

AppStrings lookupAppStrings(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppStringsEn();
    case 'ru':
      return AppStringsRu();
  }

  throw FlutterError(
    'AppStrings.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

// /*
// *  i18n.dart
// *  futuring
// *
// *  Created by Eric Pomeranz.
// *  Copyright © 2018 [Company]. All rights reserved.
//     */

// import 'package:flutter/material.dart';
// import 'package:app/generated/messages_all.dart';
// import 'package:intl/intl.dart';

// class AppLocalizations {

//   static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

//   static AppLocalizations of(BuildContext context) => Localizations.of<AppLocalizations>(context, AppLocalizations);

//   String get onboarding1widgetWillkommenBeiFuturText => Intl.message("Willkommen bei Futuring! \n", name: "onboarding1widgetWillkommenBeiFuturText");
//   String get onboarding1widgetWieDurfenWirDichText => Intl.message("Wie dürfen wir dich nennen?", name: "onboarding1widgetWieDurfenWirDichText");
//   String get onboarding1widgetTheaTextField => Intl.message("Thea", name: "onboarding1widgetTheaTextField");
//   String get onboarding1widgetMainCtaButton => Intl.message("Los geht’s", name: "onboarding1widgetMainCtaButton");
// }

// class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {

//   const _AppLocalizationsDelegate();

//   @override
//   bool isSupported(Locale locale) => [
//     "en",
//   ].contains(locale.languageCode);

//   @override
//   Future<AppLocalizations> load(Locale locale) {

//     final String name = locale.countryCode == null ? locale.languageCode : locale.toString();
//     final String localeName = Intl.canonicalizedLocale(name);
//     return initializeMessages(localeName).then((_) {

//       Intl.defaultLocale = localeName;
//       return AppLocalizations();
//     });
//   }

//   @override
//   bool shouldReload(_AppLocalizationsDelegate oldLocale) => false;
// }

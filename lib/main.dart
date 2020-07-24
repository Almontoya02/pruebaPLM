import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testplm/src/pages/form_page.dart';
import 'package:testplm/src/pages/welcome_page.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([ //Evita que no se rote la pantalla
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
   // ... app-specific localization delegate[s] here
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: [
    const Locale('es','ES'),
    const Locale('en','US'),

    ],
      title: 'Material App',
      routes: {
        'welcome':(BuildContext context)=> WelcomePage(),
        'form':(BuildContext context) => FormPage()
      },
      initialRoute: 'welcome',
    );
  }
}
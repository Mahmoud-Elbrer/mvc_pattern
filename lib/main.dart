import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:global_configuration/global_configuration.dart';
import 'generated/l10n.dart';
import 'route_generator.dart';
import 'src/helpers/app_config.dart' as config;
import 'src/helpers/custom_trace.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfiguration().loadFromAsset("configurations");
  print(CustomTrace(StackTrace.current,
      message: "base_url: ${GlobalConfiguration().getValue('base_url')}"));
  print(CustomTrace(StackTrace.current,
      message:
          "api_base_url: ${GlobalConfiguration().getValue('api_base_url')}"));
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
//  /// Supply 'the Controller' for this application.
//  MyApp({Key key}) : super(con: Controller(), key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // navigatorKey: settingRepo.navigatorKey,
        title: "appName",
        initialRoute: '/LanguagesWidget',
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
        locale: Locale('en', ''),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: ThemeData(
          fontFamily: 'TheSans',
          primaryColor: Colors.white,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              elevation: 0, foregroundColor: Colors.white),
          brightness: Brightness.light,
          dividerColor: config.Colors().accentColor(0.1),
          focusColor: config.Colors().accentColor(1),
          hintColor: config.Colors().secondColor(1),
          textTheme: TextTheme(
            headline5: TextStyle(
                fontSize: 21.0,
                color: config.Colors().secondColor(1),
                height: 1.3),
            headline4: TextStyle(
                fontSize: 19.0,
                fontWeight: FontWeight.w700,
                color: config.Colors().secondColor(1),
                height: 1.1),
            headline3: TextStyle(
                fontSize: 21.0,
                fontWeight: FontWeight.w700,
                color: config.Colors().secondColor(1),
                height: 1.3),
            headline2: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.w700,
                color: config.Colors().mainColor(1),
                height: 1.3),
            headline1: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w300,
                color: config.Colors().secondColor(1),
                height: 1.4),
            subtitle1: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w500,
                color: config.Colors().secondColor(1),
                height: 1.3,
                fontFamily: 'TheSansBold'),
            headline6: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: config.Colors().mainColor(1),
                height: 1.2),
            bodyText2: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w400,
                color: config.Colors().secondColor(1),
                height: 1.2),
            bodyText1: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: config.Colors().secondColor(1),
                height: 1.2),
            caption: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w300,
                color: config.Colors().accentColor(1),
                height: 1.2),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_devlvery/src/pages/languages.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      // case '/Splash':
      //   return MaterialPageRoute(builder: (_) => SplashScreen());
      // case '/SignUp':
      //   return MaterialPageRoute(builder: (_) => SignUpWidget());
      // case '/MobileVerification':
      //   return MaterialPageRoute(builder: (_) => SignUpWidget());
      // case '/MobileVerification2':
      //   return MaterialPageRoute(builder: (_) => SignUpWidget());
      // case '/Login':
      //   return MaterialPageRoute(builder: (_) => LoginWidget());
      // case '/ForgetPassword':
      //   return MaterialPageRoute(builder: (_) => ForgetPasswordWidget());
      // case '/Pages':
      //   return MaterialPageRoute(builder: (_) => PagesTestWidget(currentTab: args));
      // case '/OrderDetails':
      //   return MaterialPageRoute(builder: (_) => OrderWidget(routeArgument: args as RouteArgument));
      // case '/Notifications':
      //   return MaterialPageRoute(builder: (_) => NotificationsWidget());
      case '/Languages':
        return MaterialPageRoute(builder: (_) => LanguagesWidget());
      // case '/Help':
      //   return MaterialPageRoute(builder: (_) => HelpWidget());
      // case '/Settings':
      //   return MaterialPageRoute(builder: (_) => SettingsWidget());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return MaterialPageRoute(builder: (_) => Scaffold(body: SizedBox(height: 0)));
    }
  }
}

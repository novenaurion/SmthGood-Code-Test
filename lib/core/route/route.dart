import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smthgood/pages/result_page/result_page.dart';

import '../../pages/home_page/home_page.dart';

class RouteGenerator {
  static const routeHome = "/";
  static const routeResult = "/result";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeHome:
        final page = HomePage();
        return MaterialPageRoute(builder: (context) => page);

      case routeResult:
        final result = settings.arguments;
        final page = ResultPage(
          result: result.toString(),
        );
        return MaterialPageRoute(builder: (context) => page);

      default:
        return MaterialPageRoute(builder: (context) => HomePage());
    }
  }
}

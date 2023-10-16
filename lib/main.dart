import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smthgood/core/theme.dart';
import 'package:smthgood/pages/home_page/home_page.dart';

import 'bloc/home_page_bloc/home_page_bloc.dart';
import 'core/route/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code Test',
      theme: theme(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      onGenerateRoute:RouteGenerator.generateRoute,
      home: HomePage(),
    );
  }
}

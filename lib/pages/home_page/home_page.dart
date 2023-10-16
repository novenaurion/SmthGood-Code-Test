import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smthgood/pages/home_page/input_text_field_view.dart';

import '../../bloc/home_page_bloc/home_page_bloc.dart';
import 'home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: BlocProvider<HomePageBloc>(
        create: (BuildContext context) => HomePageBloc(),
        child: HomePageBody(),
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/home_page_bloc/home_page_bloc.dart';
import '../../bloc/home_page_bloc/home_page_event.dart';
import '../../bloc/home_page_bloc/home_page_state.dart';
import 'input_text_field_view.dart';
import '../../core/route/route.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomePageBloc>();
    return BlocListener<HomePageBloc, HomePageState>(
      listener: (context, state) {
        print("state==>${state.homePageStatus}");
        if (state.homePageStatus == HomePageStatus.error) {
          print('error==${state.errorText}');
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.errorText)),
            );
        } else if (state.homePageStatus == HomePageStatus.success) {
          Navigator.of(context).pushNamed(RouteGenerator.routeResult,arguments: state.finalResult).then((value)=>bloc.add(OnInitial()));
        }
      },
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width / 2,
              child: InputTextFieldView(
                onChange: (value) => bloc.add(FristInputFieldChanged(value)),
                label: "First Input",
                textInputType: TextInputType.number,
                textInputFormatter: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width / 2,
              child: InputTextFieldView(
                onChange: (value) => bloc.add(SecondInputFieldChanged(value)),
                label: "Second Input",
                textInputType: TextInputType.number,
                textInputFormatter: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: ElevatedButton(
                  onPressed: () => bloc.add(OnSubmitted()),
                  child: Text("Submit"),
                ))
          ],
        ),
      ),
    );
  }
}

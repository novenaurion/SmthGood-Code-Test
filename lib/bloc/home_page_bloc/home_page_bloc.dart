import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smthgood/bloc/home_page_bloc/home_page_event.dart';
import 'package:smthgood/bloc/home_page_bloc/home_page_state.dart';
import 'package:smthgood/core/extension/result_extension.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  static final HomePageBloc _singleton = HomePageBloc._internal();

  factory HomePageBloc() {
    return _singleton;
  }

  HomePageBloc._internal() : super(HomePageState()) {
    on<FristInputFieldChanged>(_firstInputFieldChanged);
    on<SecondInputFieldChanged>(_secondInputFieldChanged);
    on<OnSubmitted>(_onSubmitted);
    on<OnInitial>(_onInitial);
  }

  FutureOr<void> _firstInputFieldChanged(
      FristInputFieldChanged event, Emitter<HomePageState> emit) {
    print("evetn==>${event.firstInput}");
    emit(state.copyWith(homePageStatus:HomePageStatus.initial,firstInput: event.firstInput,));
  }

  FutureOr<void> _secondInputFieldChanged(
      SecondInputFieldChanged event, Emitter<HomePageState> emit) {
    print("evetn==>${event.secondInput}");
    emit(state.copyWith(homePageStatus:HomePageStatus.initial,secondInput: event.secondInput));
  }

  FutureOr<void> _onSubmitted(OnSubmitted event, Emitter<HomePageState> emit) {
    if (state.firstInput.isNotEmpty || state.secondInput.isNotEmpty) {
      int firstInput = int.parse(state.firstInput);
      int secondInput = int.parse(state.secondInput);
      if (secondInput > firstInput) {
        int result = firstInput.getResult(secondInput);
        print("result== list >$result");
        emit(state.copyWith(
            homePageStatus: HomePageStatus.success,
            finalResult: result.toString()));
      } else {
        print("hello==>its' true}");
        emit(state.copyWith(
            homePageStatus: HomePageStatus.error,
            errorText: "Please enter a valid input"));
      }
    } else {
      emit(state.copyWith(
          homePageStatus: HomePageStatus.error,
          errorText: "Please enter a valid input"));
    }
  }

  FutureOr<void> _onInitial(
      OnInitial event, Emitter<HomePageState> emit) {
    emit(
      state.copyWith(homePageStatus: HomePageStatus.initial, errorText: ""),
    );
  }
}

import 'package:equatable/equatable.dart';

enum HomePageStatus { initial, success, error }

final class HomePageState extends Equatable {
  final String firstInput;
  final String secondInput;
  final String finalResult;
  final HomePageStatus homePageStatus;
  final String errorText;

  HomePageState(
      {this.homePageStatus = HomePageStatus.initial,
      this.firstInput = "",
      this.secondInput = "",
      this.finalResult = "",
      this.errorText = "error"});

  HomePageState copyWith({
    HomePageStatus? homePageStatus,
    String? firstInput,
    String? secondInput,
    String? finalResult,
    String? errorText,
  }) {
    return HomePageState(
      homePageStatus: homePageStatus ?? this.homePageStatus,
      firstInput: firstInput ?? this.firstInput,
      secondInput: secondInput ?? this.secondInput,
      finalResult: finalResult ?? this.finalResult,
      errorText: errorText ?? this.errorText,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [homePageStatus,firstInput, secondInput, finalResult,errorText];
}

import 'package:equatable/equatable.dart';

class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class FristInputFieldChanged extends HomePageEvent {
  const FristInputFieldChanged(this.firstInput);

  final String firstInput;

  @override
  List<Object> get props => [firstInput];
}

final class SecondInputFieldChanged extends HomePageEvent {
  const SecondInputFieldChanged(this.secondInput);

  final String secondInput;

  @override
  List<Object> get props => [secondInput];
}

final class OnSubmitted extends HomePageEvent {
  const OnSubmitted();
}

final class OnInitial extends HomePageEvent {
  const OnInitial();
}

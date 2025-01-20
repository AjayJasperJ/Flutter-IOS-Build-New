part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState extends HomeState {} //rebuild states

final class HomeInitial extends HomeState {}

class ToggleScreenState extends HomeState {
  final Widget Targetpage;

  ToggleScreenState({required this.Targetpage});
}

class LoadingActionState extends HomeActionState {}

class LoadingSuccessActionState extends HomeActionState {
  final List<ProductDataModel> listdata;

  LoadingSuccessActionState({required this.listdata});
}

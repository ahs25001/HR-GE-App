part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}
class ChangeTabEvent extends HomeEvent{
  int currentTabIndex ;

  ChangeTabEvent(this.currentTabIndex);
}
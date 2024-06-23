part of 'home_bloc.dart';

enum HomeScreenState {
  init,
}

@immutable
class HomeState {
  HomeScreenState? homeScreenState;
  int? currentTab;

  HomeState({this.homeScreenState, this.currentTab});

  HomeState copyWith({HomeScreenState? homeScreenState, int? currentTab}) {
    return HomeState(
        currentTab: currentTab ?? this.currentTab,
        homeScreenState: homeScreenState ?? this.homeScreenState);
  }
}

final class HomeInitial extends HomeState {
  HomeInitial() : super(homeScreenState: HomeScreenState.init);
}

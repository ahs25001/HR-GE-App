import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static HomeBloc get(context) => BlocProvider.of(context);

  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      if (event is ChangeTabEvent) {
        emit(state.copyWith(currentTab: event.currentTabIndex));
      }
    });
  }
}

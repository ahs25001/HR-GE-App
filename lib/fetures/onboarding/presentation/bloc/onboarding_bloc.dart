import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'onboarding_event.dart';

part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  static OnboardingBloc get(BuildContext context) => BlocProvider.of(context);
  PageController pageController = PageController();

  OnboardingBloc() : super(OnboardingInitial()) {
    on<OnboardingEvent>((event, emit) {
      if (event is ToNextPageEvent) {
        pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear);
        emit(state.copyWith(index: (state.index ?? 0) + 1));
      } else if (event is ToPreviousPageEvent) {
        pageController.previousPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear);
        emit(state.copyWith(index: (state.index ?? 0) - 1));
      }
    });
  }
}

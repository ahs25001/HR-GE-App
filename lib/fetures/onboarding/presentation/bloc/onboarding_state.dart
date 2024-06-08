part of 'onboarding_bloc.dart';

enum OnboardingScreenState {
  init,
}

@immutable
class OnboardingState {
  int? index;
  OnboardingScreenState? onboardingScreenState;

  OnboardingState({this.index, this.onboardingScreenState});

  OnboardingState copyWith(
      {int? index, OnboardingScreenState? onboardingScreenState}) {
    return OnboardingState(
        index: index ?? this.index,
        onboardingScreenState:
            onboardingScreenState ?? this.onboardingScreenState);
  }
}

final class OnboardingInitial extends OnboardingState {
  OnboardingInitial()
      : super(onboardingScreenState: OnboardingScreenState.init);
}

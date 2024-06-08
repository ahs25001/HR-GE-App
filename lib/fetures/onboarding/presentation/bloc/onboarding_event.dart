part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingEvent {}

class ToNextPageEvent extends OnboardingEvent {}
class ToPreviousPageEvent extends OnboardingEvent {}

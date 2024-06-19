part of 'reliability_bloc.dart';

enum ReliabilityScreenState { init }

@immutable
class ReliabilityState {
  ReliabilityScreenState? reliabilityScreenState;

  int? currentStep;

  ReliabilityState({this.reliabilityScreenState, this.currentStep});

  ReliabilityState copyWith(
      {ReliabilityScreenState? reliabilityScreenState, int? currentStep}) {
    return ReliabilityState(
        currentStep: currentStep ?? this.currentStep,
        reliabilityScreenState:
            reliabilityScreenState ?? this.reliabilityScreenState);
  }
}

final class ReliabilityInitial extends ReliabilityState {
  ReliabilityInitial()
      : super(reliabilityScreenState: ReliabilityScreenState.init);
}

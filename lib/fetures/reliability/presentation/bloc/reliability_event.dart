part of 'reliability_bloc.dart';

@immutable
sealed class ReliabilityEvent {}

class NextStepEvent extends ReliabilityEvent {}

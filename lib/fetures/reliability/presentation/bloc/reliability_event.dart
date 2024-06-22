part of 'reliability_bloc.dart';

@immutable
sealed class ReliabilityEvent {}

class NextStepEvent extends ReliabilityEvent {}
class GetIDCardFrontEvent extends ReliabilityEvent {}
class GetIDCardBackEvent extends ReliabilityEvent {}
class GetFaceEvent extends ReliabilityEvent {}
class GetFaceRightEvent extends ReliabilityEvent {}
class GetFaceLeftEvent extends ReliabilityEvent {}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'reliability_event.dart';

part 'reliability_state.dart';

class ReliabilityBloc extends Bloc<ReliabilityEvent, ReliabilityState> {
  static ReliabilityBloc get(BuildContext context) => BlocProvider.of(context);

  ReliabilityBloc() : super(ReliabilityInitial()) {
    on<ReliabilityEvent>((event, emit) {
      if (event is NextStepEvent) {
        emit(state.copyWith(currentStep: ((state.currentStep ?? 0) + 1) % 6));
      }
    });
  }
}

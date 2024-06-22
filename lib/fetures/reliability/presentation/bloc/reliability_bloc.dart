import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/use_cases/get_image_from_camera_usecase.dart';

part 'reliability_event.dart';

part 'reliability_state.dart';

@injectable
class ReliabilityBloc extends Bloc<ReliabilityEvent, ReliabilityState> {
  static ReliabilityBloc get(BuildContext context) => BlocProvider.of(context);
  PageController? controller = PageController();
  GetImageFromCameraUseCase getImageFromCameraUseCase;

  ReliabilityBloc(this.getImageFromCameraUseCase)
      : super(ReliabilityInitial()) {
    on<ReliabilityEvent>((event, emit) async {
      if (event is NextStepEvent) {
        controller?.nextPage(
            duration: const Duration(milliseconds: 300), curve: Curves.linear);
        emit(state.copyWith(currentStep: ((state.currentStep ?? 0) + 1) % 6));
      } else if (event is GetIDCardFrontEvent) {
        File? imageFile = await getImageFromCameraUseCase();
        emit(state.copyWith(
            idCardFrontFile: imageFile,
            reliabilityScreenState:
                ReliabilityScreenState.getFrontIDCardSuccess));
      } else if (event is GetIDCardBackEvent) {
        File? imageFile = await getImageFromCameraUseCase();
        emit(state.copyWith(
            idCardBackFile: imageFile,
            reliabilityScreenState:
                ReliabilityScreenState.getBackIDCardSuccess));
      } else if (event is GetFaceEvent) {
        File? imageFile = await getImageFromCameraUseCase();
        emit(state.copyWith(
            faceFile: imageFile,
            reliabilityScreenState: ReliabilityScreenState.getFaceSuccess));
      } else if (event is GetFaceRightEvent) {
        File? imageFile = await getImageFromCameraUseCase();
        emit(state.copyWith(
            faceRightFile: imageFile,
            reliabilityScreenState:
                ReliabilityScreenState.getFaceRightSuccess));
      } else if (event is GetFaceLeftEvent) {
        File? imageFile = await getImageFromCameraUseCase();
        emit(state.copyWith(
            faceLeftFile: imageFile,
            reliabilityScreenState: ReliabilityScreenState.getFaceLeftSuccess));
      }
    });
  }
}

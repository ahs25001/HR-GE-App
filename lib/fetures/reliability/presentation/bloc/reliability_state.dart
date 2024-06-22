part of 'reliability_bloc.dart';

enum ReliabilityScreenState {
  init,
  getFrontIDCardSuccess,
  getBackIDCardSuccess,
  getFaceSuccess,
  getFaceRightSuccess,
  getFaceLeftSuccess,
}

@immutable
class ReliabilityState {
  ReliabilityScreenState? reliabilityScreenState;
  File? idCardFrontFile;
  File? idCardBackFile;
  File? faceFile;
  File? faceRightFile;
  File? faceLeftFile;
  int? currentStep;

  ReliabilityState(
      {this.reliabilityScreenState,
      this.currentStep,
      this.idCardFrontFile,
      this.idCardBackFile,
      this.faceFile,
      this.faceLeftFile,
      this.faceRightFile});

  ReliabilityState copyWith(
      {ReliabilityScreenState? reliabilityScreenState,
      File? idCardFrontFile,
      File? idCardBackFile,
      File? faceFile,
      File? faceRightFile,
      File? faceLeftFile,
      int? currentStep}) {
    return ReliabilityState(
        faceFile: faceFile ?? this.faceFile,
        faceLeftFile: faceLeftFile ?? this.faceLeftFile,
        faceRightFile: faceRightFile ?? this.faceRightFile,
        currentStep: currentStep ?? this.currentStep,
        idCardBackFile: idCardBackFile ?? this.idCardBackFile,
        idCardFrontFile: idCardFrontFile ?? this.idCardFrontFile,
        reliabilityScreenState:
            reliabilityScreenState ?? this.reliabilityScreenState);
  }
}

final class ReliabilityInitial extends ReliabilityState {
  ReliabilityInitial()
      : super(reliabilityScreenState: ReliabilityScreenState.init);
}

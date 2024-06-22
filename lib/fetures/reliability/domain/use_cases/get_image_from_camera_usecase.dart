import 'dart:io';

import 'package:he_dg/fetures/reliability/domain/repositories/reliability_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetImageFromCameraUseCase {
  ReliabilityRepo reliabilityRepo;

  GetImageFromCameraUseCase(this.reliabilityRepo);

  Future<File?> call() => reliabilityRepo.getImageFromCamera();
}

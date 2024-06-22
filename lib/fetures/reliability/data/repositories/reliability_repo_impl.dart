import 'dart:io';

import 'package:he_dg/fetures/reliability/data/data_sources/local_ds/reliability_local_ds.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/reliability_repo.dart';

@Injectable(as: ReliabilityRepo)
class ReliabilityRepoImpl extends ReliabilityRepo {
  ReliabilityLocalDs reliabilityLocalDs;

  ReliabilityRepoImpl(this.reliabilityLocalDs);

  @override
  Future<File?> getImageFromCamera() => reliabilityLocalDs.getImageFromCamera();
}

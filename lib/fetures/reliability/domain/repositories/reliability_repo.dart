import 'dart:io';

import 'package:injectable/injectable.dart';

@injectable
abstract class ReliabilityRepo {
  Future <File?> getImageFromCamera();
}
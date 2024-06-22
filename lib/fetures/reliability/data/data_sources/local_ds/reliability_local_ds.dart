import 'dart:io';

import 'package:injectable/injectable.dart';

@injectable

abstract class ReliabilityLocalDs{
  Future <File?> getImageFromCamera();
}
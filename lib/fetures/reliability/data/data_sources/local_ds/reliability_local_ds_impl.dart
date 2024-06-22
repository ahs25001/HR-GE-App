import 'dart:io';

import 'package:he_dg/core/cache/image_picker.dart';
import 'package:he_dg/fetures/reliability/data/data_sources/local_ds/reliability_local_ds.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ReliabilityLocalDs)
class ReliabilityLocalDsImpl extends ReliabilityLocalDs {
  ImagePickerManager imagePickerManager;

  ReliabilityLocalDsImpl(this.imagePickerManager);

  @override
  Future<File?> getImageFromCamera() async {
    var image = await imagePickerManager.getImageFromCamera();
    if (image != null) {
      return File(image.path);
    }
    return null;
  }
}

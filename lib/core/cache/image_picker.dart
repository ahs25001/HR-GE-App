import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@singleton
class ImagePickerManager {
  final ImagePicker picker = ImagePicker();

  Future<XFile?> getImageFromCamera() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    return photo;
  }
}

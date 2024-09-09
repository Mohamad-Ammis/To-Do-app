import 'package:image_picker/image_picker.dart';

Future pickImageFromGallery() async {
  final XFile selectedImage;
  final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (image != null) {
    selectedImage = image;
    return selectedImage.path;
  } else {
    return '';
  }
}

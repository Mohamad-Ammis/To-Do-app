import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  /// اختيار الصورة من المعرض
  Future<String?> pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        await _saveImage(image.path);
        return image.path;
      }
    } catch (e) {
      print("Error picking image from gallery: $e");
    }
    return null;
  }

  /// التقاط الصورة باستخدام الكاميرا
  Future<String?> captureImageWithCamera() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        await _saveImage(image.path);
        return image.path;
      }
    } catch (e) {
      print("Error capturing image with camera: $e");
    }
    return null;
  }

  /// اختيار الفيديو من المعرض
  Future<String?> pickVideoFromGallery() async {
    try {
      final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
      if (video != null) {
        await _saveVideo(video.path);
        return video.path;
      }
    } catch (e) {
      print("Error picking video from gallery: $e");
    }
    return null;
  }

  /// التقاط الفيديو باستخدام الكاميرا
  Future<String?> captureVideoWithCamera() async {
    try {
      final XFile? video = await _picker.pickVideo(source: ImageSource.camera);
      if (video != null) {
        await _saveVideo(video.path);
        return video.path;
      }
    } catch (e) {
      print("Error capturing video with camera: $e");
    }
    return null;
  }

  /// تحميل الصورة من SharedPreferences
  Future<String?> loadImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('profile_image') ?? '';
  }

  /// تحميل الفيديو من SharedPreferences
  Future<String?> loadVideo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('profile_video') ?? '';
  }

  /// مسح الصورة أو الفيديو من SharedPreferences
  Future<void> clearMedia(String mediaType) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (mediaType == 'image') {
      await prefs.remove('profile_image');
    } else if (mediaType == 'video') {
      await prefs.remove('profile_video');
    }
  }

  /// اختيار الصور المتعددة من المعرض
  Future<List<String>?> pickMultipleImages() async {
    try {
      final List<XFile>? images = await _picker.pickMultiImage();
      if (images != null && images.isNotEmpty) {
        List<String> imagePaths = images.map((image) => image.path).toList();
        // لا تخزن الصور المتعددة في SharedPreferences لأن هذا غير مدعوم كقائمة، لكن يمكن التعامل معها في التطبيق.
        return imagePaths;
      }
    } catch (e) {
      print("Error picking multiple images: $e");
    }
    return null;
  }

  /// حفظ الصورة في SharedPreferences
  Future<void> _saveImage(String path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_image', path);
  }

  /// حفظ الفيديو في SharedPreferences
  Future<void> _saveVideo(String path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_video', path);
  }
}

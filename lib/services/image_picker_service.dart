import 'dart:developer';

import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  Future<String?> pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        await _saveImage(image.path);
        return image.path;
      }
    } catch (e) {
      log("Error picking image from gallery: $e");
    }
    return null;
  }

  Future<String?> captureImageWithCamera() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        await _saveImage(image.path);
        return image.path;
      }
    } catch (e) {
      log("Error capturing image with camera: $e");
    }
    return null;
  }

  Future<String?> pickVideoFromGallery() async {
    try {
      final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
      if (video != null) {
        await _saveVideo(video.path);
        return video.path;
      }
    } catch (e) {
      log("Error picking video from gallery: $e");
    }
    return null;
  }

  Future<String?> captureVideoWithCamera() async {
    try {
      final XFile? video = await _picker.pickVideo(source: ImageSource.camera);
      if (video != null) {
        await _saveVideo(video.path);
        return video.path;
      }
    } catch (e) {
      log("Error capturing video with camera: $e");
    }
    return null;
  }

  Future<String?> loadImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('profile_image') ?? '';
  }

  Future<String?> loadVideo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('profile_video') ?? '';
  }

  Future<void> clearMedia(String mediaType) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (mediaType == 'image') {
      await prefs.remove('profile_image');
    } else if (mediaType == 'video') {
      await prefs.remove('profile_video');
    }
  }

  Future<List<String>?> pickMultipleImages() async {
    try {
      final List<XFile> images = await _picker.pickMultiImage();
      if (images.isNotEmpty) {
        List<String> imagePaths = images.map((image) => image.path).toList();
        return imagePaths;
      }
    } catch (e) {
      log("Error picking multiple images: $e");
    }
    return null;
  }

  Future<void> _saveImage(String path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_image', path);
  }

  Future<void> _saveVideo(String path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_video', path);
  }
}

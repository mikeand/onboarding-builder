import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageCapture extends StatefulWidget {
  const ImageCapture({Key? key}) : super(key: key);

  @override
  State<ImageCapture> createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  File? _storedImage;

  Future<void> _takePicture() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (photo != null) {
      _storedImage = File(photo.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          child: _storedImage != null
              ? Image.file(_storedImage!)
              : const Text(
                  "No Image Taken",
                  textAlign: TextAlign.center,
                ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: TextButton.icon(
          onPressed: _takePicture,
          icon: const Icon(Icons.camera),
          label: const Text("Take Picture"),
        ))
      ],
    );
  }
}

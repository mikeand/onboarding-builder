import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageCapture extends StatefulWidget {
  const ImageCapture({Key? key}) : super(key: key);

  @override
  State<ImageCapture> createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  XFile? _storedImage;
  final _picker = ImagePicker();
  String _message = "No Image";

  Future<void> _takePicture() async {
    final XFile? photo = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    _storedImage = photo;
  }

  Future<void> getLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.files != null) {
      for (final XFile file in response.files!) {
        _storedImage = file;
      }
    } else {
      _message = response.exception?.message ?? "No Image";
    }
  }

  Widget _displayWidget() {
    Widget? image;
    if (_storedImage != null && kIsWeb) {
      image = Image.network(
        _storedImage!.path,
        fit: BoxFit.cover,
      );
    } else if (_storedImage != null) {
      image = Image.file(
        File(_storedImage!.path),
        fit: BoxFit.cover,
      );
    } else {
      image = Text(
        _message,
        textAlign: TextAlign.center,
      );
    }

    return Container(
        width: 130,
        height: 130,
        decoration: BoxDecoration(border: Border.all()),
        child: _storedImage == null ? null : image);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        !kIsWeb && defaultTargetPlatform == TargetPlatform.android
            ? FutureBuilder(
                future: getLostData(),
                builder: (BuildContext ctx, AsyncSnapshot<void> snapshot) {
                  return Container(
                      alignment: Alignment.center, child: _displayWidget());
                })
            : Container(alignment: Alignment.center, child: _displayWidget()),
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

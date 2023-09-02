import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

XFile? pickedImage;

String selectedImage = '';

class CircleAvatarWithAddButton extends StatelessWidget {
  CircleAvatarWithAddButton({
    Key? key,
  }) : super(key: key);
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.amber,
              image: selectedImage.isEmpty
                  ? const DecorationImage(
                      image: AssetImage('assets/images/defaultprofile.png'),
                      fit: BoxFit.cover)
                  : DecorationImage(
                      image: FileImage(File(selectedImage)),
                      fit: BoxFit.cover)),
        ),
        Positioned(
          bottom: -5,
          left: 90,
          child: IconButton(
            onPressed: () async {
              pickedImage = await _pickImage();
              if (pickedImage != null) {
                selectedImage = pickedImage!.path;
              }
            },
            icon: const Icon(
              Icons.add_a_photo_outlined,
              size: 35,
            ),
          ),
        ),
      ],
    );
  }

  _pickImage() async {
    try {
      final pick = await picker.pickImage(source: ImageSource.gallery);
      if (pick == null) {
        return Exception('no image selected');
      }
      return pick;
    } catch (e) {
      return Exception(e);
    }
  }
}

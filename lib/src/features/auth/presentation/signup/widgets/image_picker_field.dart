import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerField extends StatelessWidget {
  final Function(XFile?) onImageSelected;
  const ImagePickerField({super.key, required this.onImageSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: ElevatedButton.icon(
        onPressed: () async {
          final ImagePicker picker = ImagePicker();
          final XFile? image =
              await picker.pickImage(source: ImageSource.gallery);
          onImageSelected(image);
        },
        icon: const Icon(Icons.image),
        label: const Text('Select Profile Image'),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.blueAccent,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }
}

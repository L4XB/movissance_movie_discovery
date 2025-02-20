import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerField extends StatelessWidget {
  final Function(XFile?) onImageSelected;
  const ImagePickerField({super.key, required this.onImageSelected});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04, vertical: size.height * 0.0125),
      child: ElevatedButton.icon(
        onPressed: () async {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return SafeArea(
                child: Wrap(
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.photo_library),
                      title: const Text("Gallery"),
                      onTap: () async {
                        final ImagePicker picker = ImagePicker();
                        final XFile? image =
                            await picker.pickImage(source: ImageSource.gallery);
                        onImageSelected(image);
                        if (context.mounted) {
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.photo_camera),
                      title: const Text("Camera"),
                      onTap: () async {
                        final ImagePicker picker = ImagePicker();
                        final XFile? image =
                            await picker.pickImage(source: ImageSource.camera);
                        onImageSelected(image);
                        if (context.mounted) {
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          );
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

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';

class ImagePickerField extends StatelessWidget {
  final Function(XFile?) onImageSelected;
  const ImagePickerField({super.key, required this.onImageSelected});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04, vertical: size.height * 0.0125),
      child: ElevatedButton.icon(
        onPressed: () async {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                color: themeExtension?.mainBackGroundColor,
                child: Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.03),
                  child: Wrap(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.photo_library,
                            color: themeExtension?.mainIconColor),
                        title: Text(
                          "Gallery",
                          style:
                              TextStyle(color: themeExtension?.mainTextColor),
                        ),
                        onTap: () async {
                          final ImagePicker picker = ImagePicker();
                          final XFile? image = await picker.pickImage(
                              source: ImageSource.gallery);
                          onImageSelected(image);
                          if (context.mounted) {
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.photo_camera,
                            color: themeExtension?.mainIconColor),
                        title: Text(
                          "Camera",
                          style:
                              TextStyle(color: themeExtension?.mainTextColor),
                        ),
                        onTap: () async {
                          final ImagePicker picker = ImagePicker();
                          final XFile? image = await picker.pickImage(
                              source: ImageSource.camera);
                          onImageSelected(image);
                          if (context.mounted) {
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        icon: Icon(Icons.image, color: themeExtension?.mainIconColor),
        label: Text(
          "Select Profile Image",
          style: TextStyle(color: themeExtension?.primaryColor),
        ),
        style: ElevatedButton.styleFrom(
          foregroundColor: themeExtension?.primaryColor,
          backgroundColor: themeExtension?.contrastTextColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }
}

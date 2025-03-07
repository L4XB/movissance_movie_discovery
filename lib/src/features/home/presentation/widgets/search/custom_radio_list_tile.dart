import 'package:flutter/material.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';

class CustomRadioListTile extends StatelessWidget {
  final String title;
  final int value;
  final int groupValue;
  final ValueChanged<int?> onChanged;

  const CustomRadioListTile({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    /// ----------------- Local Variables ----------------- ///
    final size = MediaQuery.of(context).size;
    final scaler = MediaQuery.of(context).textScaler;
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();

    /// ----------------- Widget ----------------- ///
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: themeExtension?.mainTextColor),
      ),
      leading: GestureDetector(
        onTap: () => onChanged(value),
        child: Container(
          width: size.width * 0.06,
          height: size.width * 0.06,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: groupValue == value
                  ? themeExtension?.secondaryColor as Color
                  : themeExtension?.mainIconColor as Color,
              width: 2.5,
            ),
          ),
          child: groupValue == value
              ? Center(
                  child: Icon(
                    Icons.check,
                    size: scaler.scale(18),
                    color: themeExtension?.secondaryColor,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}

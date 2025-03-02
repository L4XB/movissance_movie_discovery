import 'package:flutter/material.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportTile extends StatelessWidget {
  const SupportTile({
    super.key,
    required this.size,
    required this.textScaler,
    required this.themeExtension,
  });

  final Size size;
  final TextScaler textScaler;
  final CustomThemeColorsExtension? themeExtension;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.0055),
      child: ListTile(
        onTap: () async {
          final Uri emailLaunchUri = Uri(
            scheme: 'mailto',
            path: 'support.readline.movies@lukasbuck.com',
          );
          if (await canLaunchUrl(emailLaunchUri)) {
            await launchUrl(emailLaunchUri);
          } else {
            throw 'Could not launch $emailLaunchUri';
          }
        },
        title: Text("Support",
            style: TextStyle(
                color: themeExtension?.mainTextColor,
                fontSize: textScaler.scale(15),
                fontWeight: FontWeight.bold)),
        trailing: Padding(
          padding: EdgeInsets.only(right: size.width * 0.025),
          child: Icon(
            Icons.arrow_forward_ios,
            color: themeExtension?.mainIconColor,
            size: textScaler.scale(18),
          ),
        ),
      ),
    );
  }
}

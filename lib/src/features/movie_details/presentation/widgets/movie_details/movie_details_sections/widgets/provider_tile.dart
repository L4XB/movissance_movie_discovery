import 'package:flutter/material.dart';
import 'package:red_line/src/common/config/config.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/features/movie_details/domain/provider_model.dart';

class ProviderTile extends StatelessWidget {
  final Provider provider;

  const ProviderTile({required this.provider, super.key});

  @override
  Widget build(BuildContext context) {
    /// ----------------- Local Variables ----------------- ///
    final size = MediaQuery.of(context).size;
    final scaler = MediaQuery.of(context).textScaler;
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();

    /// ----------------- Widget ----------------- ///
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, vertical: size.height * 0.008),
        child: Container(
          decoration: BoxDecoration(
            color: themeExtension?.overlayElementBackgroundColor,
            border: Border.all(
              color: themeExtension?.inputFieldBorderColor as Color,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: ListTile(
            leading: Image.network(
              theMovieDatabaseApiImageBaseURL + provider.logoPath,
              width: size.width * 0.1,
              fit: BoxFit.cover,
            ),
            title: Text(provider.providerName,
                style: TextStyle(
                    fontSize: scaler.scale(18),
                    fontWeight: FontWeight.w500,
                    color: themeExtension?.mainTextColor)),
          ),
        ));
  }
}

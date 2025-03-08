import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/common/services/location_service.dart';
import 'package:red_line/src/features/profile/cubit/profile_cubit.dart';

class CountryCodeTile extends StatelessWidget {
  const CountryCodeTile({
    super.key,
    required this.size,
    required this.textScaler,
    required this.themeExtension,
    required this.countryCode,
  });

  final Size size;
  final TextScaler textScaler;
  final CustomThemeColorsExtension? themeExtension;
  final String countryCode;

  @override
  Widget build(BuildContext context) {
    /// ----------------- Widget ----------------- ///
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.0055),
      child: ListTile(
        title: Text(
          "Country Code",
          style: TextStyle(
            color: themeExtension?.mainTextColor,
            fontSize: textScaler.scale(15),
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Tooltip(
              message: 'Use your current location',
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () async {
                  final locationService = LocationService();
                  final countryCode = await locationService.getCountryCode();
                  if (countryCode != null) {
                    if (context.mounted) {
                      context
                          .read<ProfileCubit>()
                          .updateCountryCode(countryCode);
                    }
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.location_searching_sharp,
                    color: themeExtension?.mainIconColor,
                    size: textScaler.scale(22),
                  ),
                ),
              ),
            ),
            SizedBox(width: size.width * 0.01),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: themeExtension?.inputFieldBorderColor as Color,
                  width: 1,
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: countryCode,
                  isDense: true,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: themeExtension?.mainIconColor,
                  ),
                  dropdownColor:
                      themeExtension?.secondaryOverlayElementBackgroundColor,
                  items: <String>['US', 'DE', 'FR', 'GB', 'IT', 'ES']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          fontSize: textScaler.scale(14),
                          color: themeExtension?.mainTextColor,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      context.read<ProfileCubit>().updateCountryCode(newValue);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

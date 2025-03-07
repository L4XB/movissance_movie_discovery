import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/features/auth/data/auth_repository.dart';
import 'package:red_line/src/features/profile/cubit/profile_cubit.dart';
import 'package:red_line/src/features/profile/presentation/widgtes/settings_section/widgets/country_code_tile.dart';
import 'package:red_line/src/features/profile/presentation/widgtes/settings_section/widgets/dark_mode_tile.dart';
import 'package:red_line/src/features/profile/presentation/widgtes/settings_section/widgets/delete_account_tile.dart';
import 'package:red_line/src/features/profile/presentation/widgtes/settings_section/widgets/divider_tile.dart';
import 'package:red_line/src/features/profile/presentation/widgtes/settings_section/widgets/notifications_tile.dart';
import 'package:red_line/src/features/profile/presentation/widgtes/settings_section/widgets/reset_password_tile.dart';
import 'package:red_line/src/features/profile/presentation/widgtes/settings_section/widgets/support_tile.dart';

class SettingsSection extends StatelessWidget {
  final AuthRepository authRepository;
  final PersistentTabController controller;
  const SettingsSection(
      {super.key, required this.authRepository, required this.controller});

  @override
  Widget build(BuildContext context) {
    /// ----------------- Local Variables ----------------- ///
    final size = MediaQuery.of(context).size;
    final textScaler = MediaQuery.of(context).textScaler;
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();

    /// ----------------- Widget ----------------- ///
    return Center(
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            color: themeExtension?.secondaryOverlayElementBackgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          width: size.width * 0.9,
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoaded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DarkModeTile(
                      size: size,
                      textScaler: textScaler,
                      themeExtension: themeExtension,
                      isDarkMode: state.isDarkMode,
                    ),
                    DividerTile(size: size, themeExtension: themeExtension),
                    NotificationsTile(
                      size: size,
                      textScaler: textScaler,
                      themeExtension: themeExtension,
                      isNotificationsEnabled: state.isNotificationsEnabled,
                    ),
                    DividerTile(size: size, themeExtension: themeExtension),
                    CountryCodeTile(
                      size: size,
                      textScaler: textScaler,
                      themeExtension: themeExtension,
                      countryCode: state.countryCode,
                    ),
                    DividerTile(size: size, themeExtension: themeExtension),
                    ResetPasswordTile(
                      size: size,
                      textScaler: textScaler,
                      themeExtension: themeExtension,
                      authRepository: authRepository,
                    ),
                    DividerTile(size: size, themeExtension: themeExtension),
                    SupportTile(
                      size: size,
                      textScaler: textScaler,
                      themeExtension: themeExtension,
                    ),
                    DividerTile(size: size, themeExtension: themeExtension),
                    DeleteAccountTile(
                      controller: controller,
                    )
                  ],
                );
              } else {
                return CircularProgressIndicator(
                  color: themeExtension?.primaryColor,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

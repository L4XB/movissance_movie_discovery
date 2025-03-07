import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/common/services/cubit_reset_service.dart';
import 'package:red_line/src/common/utils/firebase_error_text_converter.dart';
import 'package:red_line/src/common/utils/snack_bars.dart';
import 'package:red_line/src/features/auth/cubit/user_data_cubit.dart';
import 'package:red_line/src/features/auth/data/auth_repository.dart';
import 'package:red_line/src/features/auth/data/firebase_auth_repository.dart';
import 'package:red_line/src/features/auth/presentation/login/widgets/password_text_field.dart';
import 'package:red_line/src/features/favorites/data/favourites_repository.dart';
import 'package:red_line/src/features/favorites/data/firestore_favourites_repository.dart';
import 'package:red_line/src/features/profile/cubit/profile_cubit.dart';

class DeleteAccountTile extends StatefulWidget {
  final PersistentTabController controller;
  const DeleteAccountTile({super.key, required this.controller});

  @override
  State<DeleteAccountTile> createState() => _DeleteAccountTileState();
}

class _DeleteAccountTileState extends State<DeleteAccountTile> {
  late TextEditingController _passwordRepeatController;

  @override
  void initState() {
    _passwordRepeatController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _passwordRepeatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();
    final textScaler = MediaQuery.of(context).textScaler;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.0055),
      child: ListTile(
        onTap: () async {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: themeExtension?.mainBackGroundColor,
                title: Center(
                    child: Text(
                  "Delete Account",
                  style: TextStyle(
                      color: themeExtension?.mainTextColor,
                      fontWeight: FontWeight.bold),
                )),
                content: Wrap(
                  children: [
                    Text(
                      "Are you sure you want to delete your account forever?",
                      style: TextStyle(color: themeExtension?.mainTextColor),
                    ),
                    SizedBox(
                      height: size.height * 0.07,
                    ),
                    Text(
                      "Please enter your password to confirm:",
                      style: TextStyle(color: themeExtension?.mainTextColor),
                    ),
                    SizedBox(
                      height: size.height * 0.07,
                    ),
                    PasswordTextField(
                        controller: _passwordRepeatController,
                        label: "Password"),
                    SizedBox(
                      height: size.height * 0.07,
                    ),
                  ],
                ),
                actionsAlignment: MainAxisAlignment.center,
                actions: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor:
                            themeExtension?.secondaryBackgroundColor),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Cancel",
                        style: TextStyle(
                            color: themeExtension?.primaryColor,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor:
                            themeExtension?.secondaryBackgroundColor),
                    onPressed: () async {
                      final FavouritesRepository favouritesRepository =
                          FirestoreFavouritesRepository();

                      final AuthRepository authRepository =
                          FirebaseAuthRepository();
                      try {
                        if (context.mounted) {
                          await favouritesRepository.deleteAllFavourites(
                              context.read<UserDataCubit>().state?.uid ?? "");
                        }

                        if (context.mounted) {
                          final password = _passwordRepeatController.text;
                          await authRepository.deleteUser(password);
                        }

                        if (context.mounted) {
                          await context.read<ProfileCubit>().clearData();
                        }

                        widget.controller.jumpToTab(0);
                        if (context.mounted) {
                          CubitResetService.resetCubits(context);
                        }
                      } catch (e) {
                        final errorText =
                            FirebaseErrorTextConverter.convertFirebaseError(
                                e.toString());
                        if (context.mounted) {
                          Navigator.of(context).pop();
                          SnackBars.showStatusSnackBar(errorText, context,
                              isWarning: true);
                        }
                      }
                    },
                    child: Text(
                      "Delete",
                      style: TextStyle(
                          color: themeExtension?.warningColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              );
            },
          );
        },
        title: Text("Delete Account",
            style: TextStyle(
                color: themeExtension?.warningColor,
                fontSize: textScaler.scale(15),
                fontWeight: FontWeight.bold)),
        trailing: Padding(
          padding: EdgeInsets.only(right: size.width * 0.025),
          child: Icon(
            Icons.delete_forever,
            color: themeExtension?.warningColor,
            size: textScaler.scale(22),
          ),
        ),
      ),
    );
  }
}

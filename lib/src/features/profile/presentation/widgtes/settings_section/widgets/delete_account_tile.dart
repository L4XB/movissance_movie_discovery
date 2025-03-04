import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/common/services/cubit_reset_service.dart';
import 'package:red_line/src/features/auth/cubit/user_data_cubit.dart';
import 'package:red_line/src/features/favorites/data/firestore_favourites_repository.dart';

class DeleteAccountTile extends StatelessWidget {
  final PersistentTabController controller;
  const DeleteAccountTile({super.key, required this.controller});

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
                content: Text(
                  "Are you sure you want to delete your account forever?",
                  style: TextStyle(color: themeExtension?.mainTextColor),
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
                      try {
                        FirestoreFavouritesRepository().deleteAllFavourites(
                            context.read<UserDataCubit>().state?.uid ?? "");
                        await context.read<UserDataCubit>().state?.delete();
                        controller.jumpToTab(0);
                        if (context.mounted) {
                          CubitResetService.resetCubits(context);
                          Navigator.of(context).pop();
                        }
                      } catch (e) {
                        if (context.mounted) {
                          showAboutDialog(
                            context: context,
                            children: [
                              Text(
                                "An error occurred while deleting the account",
                                style: TextStyle(
                                    color: themeExtension?.warningColor),
                              ),
                            ],
                          );
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/features/auth/data/auth_repository.dart';
import 'package:red_line/src/features/auth/presentation/password_reset/password_reset.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsSection extends StatelessWidget {
  final AuthRepository authRepository;
  const SettingsSection({super.key, required this.authRepository});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScaler = MediaQuery.of(context).textScaler;
    return Center(
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            color: CupertinoColors.systemGrey6,
            borderRadius: BorderRadius.circular(10),
          ),
          width: size.width * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.0055),
                child: ListTile(
                  title: Text("Dark Mode",
                      style: TextStyle(
                          fontSize: textScaler.scale(15),
                          fontWeight: FontWeight.bold)),
                  trailing: Switch(
                    value: true,
                    activeColor: CupertinoColors.activeBlue,
                    onChanged: (value) {},
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.025),
                child: Divider(
                  height: 1,
                  thickness: 1.5,
                  color: CupertinoColors.systemGrey,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.0055),
                child: ListTile(
                  title: Text("Notifications",
                      style: TextStyle(
                          fontSize: textScaler.scale(15),
                          fontWeight: FontWeight.bold)),
                  trailing: Switch(
                    activeColor: CupertinoColors.activeBlue,
                    value: true,
                    onChanged: (value) {},
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.025),
                child: Divider(
                  height: 1,
                  thickness: 1.5,
                  color: CupertinoColors.systemGrey,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.0055),
                child: GestureDetector(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: PasswordResetScreen(
                        authRepository: authRepository,
                      ),
                      withNavBar: false,
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  },
                  child: ListTile(
                    title: Text("Reset Password",
                        style: TextStyle(
                            fontSize: textScaler.scale(15),
                            fontWeight: FontWeight.bold)),
                    trailing: Padding(
                      padding: EdgeInsets.only(right: size.width * 0.025),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: textScaler.scale(18),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.025),
                child: Divider(
                  height: 1,
                  thickness: 1.5,
                  color: CupertinoColors.systemGrey,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.0055),
                child: ListTile(
                  onTap: () async {
                    final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'support@redline.com',
                    );
                    if (await canLaunchUrl(emailLaunchUri)) {
                      await launchUrl(emailLaunchUri);
                    } else {
                      throw 'Could not launch $emailLaunchUri';
                    }
                  },
                  title: Text("Support",
                      style: TextStyle(
                          fontSize: textScaler.scale(15),
                          fontWeight: FontWeight.bold)),
                  trailing: Padding(
                    padding: EdgeInsets.only(right: size.width * 0.025),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: textScaler.scale(18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

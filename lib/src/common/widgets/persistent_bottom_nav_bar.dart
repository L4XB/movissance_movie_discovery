import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/features/auth/data/auth_repository.dart';
import 'package:red_line/src/features/discover/presentation/discover.dart';
import 'package:red_line/src/features/favorites/presentation/favourites.dart';
import 'package:red_line/src/features/home/presentation/home.dart';
import 'package:red_line/src/features/profile/presentation/profile.dart';

class PersistentBottomNavBar extends StatelessWidget {
  final PersistentTabController controller;
  final AuthRepository authRepository;
  const PersistentBottomNavBar(
      {super.key, required this.controller, required this.authRepository});

  @override
  Widget build(BuildContext context) {
    /// ----------------- Local Variables ----------------- ///
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();

    /// ----------------- Widget ----------------- ///
    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(themeExtension),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      hideNavigationBarWhenKeyboardAppears: true,
      padding: const EdgeInsets.only(top: 8),
      backgroundColor: themeExtension?.secondaryBackgroundColor as Color,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 300),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight,
    );
  }

  /// [themeExtension] the theme extension to get the colors
  /// [returns] list of [PersistentBottomNavBarItem]
  List<PersistentBottomNavBarItem> _navBarsItems(
      CustomThemeColorsExtension? themeExtension) {
    return [
      /// home element
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: themeExtension?.secondaryColor as Color,
        inactiveColorPrimary: themeExtension?.mainIconColor,
      ),

      /// favorites element
      PersistentBottomNavBarItem(
        icon: Icon(Icons.bookmark),
        title: ("Favorites"),
        activeColorPrimary: themeExtension?.secondaryColor as Color,
        inactiveColorPrimary: themeExtension?.mainIconColor,
      ),

      /// discover element
      PersistentBottomNavBarItem(
        icon: Icon(Icons.explore),
        title: ("Discover"),
        activeColorPrimary: themeExtension?.secondaryColor as Color,
        inactiveColorPrimary: themeExtension?.mainIconColor,
      ),

      /// account element
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: ("Account"),
        activeColorPrimary: themeExtension?.secondaryColor as Color,
        inactiveColorPrimary: themeExtension?.mainIconColor,
      ),
    ];
  }

  /// [retunrs] a list of [Widget] to be displayed in the [PersistentTabView]
  List<Widget> _buildScreens() {
    return [
      /// home screen
      HomeScreen(
        controller: controller,
      ),

      /// favorites screen
      Favourites(
        controller: controller,
      ),

      /// discover screen
      DiscoverScreen(
        controller: controller,
      ),

      /// profile screen
      ProfileScreen(
        controller: controller,
        authRepository: authRepository,
      )
    ];
  }
}

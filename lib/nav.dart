import 'package:app_go/pages/cart_page.dart';
import 'package:app_go/pages/home.dart';
import 'package:app_go/pages/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;
    controller = PersistentTabController(initialIndex: 0);

    List<Widget> _buildScreens() {
      return [
        const FrontPage(),
        const PlaceHolderPage(),
        const PlaceHolderPage(),
        const CartPage(),
        const PlaceHolderPage(),
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home_filled),
          title: ("Home"),
          activeColorPrimary: const Color.fromARGB(255, 151, 71, 255),
          inactiveColorPrimary: Color.fromARGB(111, 151, 71, 255),
        ),
        PersistentBottomNavBarItem(
          icon:  const Icon(Icons.wallet),
          title: ("Coins"),
          activeColorPrimary: const Color.fromARGB(255, 151, 71, 255),
          inactiveColorPrimary: Color.fromARGB(111, 151, 71, 255),
        ),
        PersistentBottomNavBarItem(
          icon: Image.asset('assets/go_icon.png'),
          title: ("Go4Life"),
          activeColorPrimary: Colors.deepPurple,
          inactiveColorPrimary: Color.fromARGB(111, 151, 71, 255),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.shopping_cart),
          title: 'Cart',
          activeColorPrimary: Color.fromARGB(255, 151, 71, 255),
          inactiveColorPrimary: Color.fromARGB(111, 151, 71, 255),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          title: 'Profile',
          activeColorPrimary: Color.fromARGB(255, 151, 71, 255),
          inactiveColorPrimary: Color.fromARGB(111, 151, 71, 255),
        ),
      ];
    }

    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}
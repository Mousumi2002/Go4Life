import 'package:app_go/pages/cart_page.dart';
import 'package:app_go/pages/home.dart';
import 'package:app_go/pages/placeholder.dart';
import 'package:app_go/provider/auth_provider.dart';
import 'package:app_go/provider/cart_provider.dart';
import 'package:app_go/provider/doctor_provider.dart';
import 'package:app_go/provider/medicine_provider.dart';
import 'package:app_go/provider/vendor_provider.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  @override
  void initState() {
    final uid = context.read<AuthProvider>().uid;
    context.read<CartProvider>().addCartItemListener(uid);
    context.read<MedicineProvider>().addMedicineItemListener();
    context.read<VendorProvider>().addVendorItemListener();
    context.read<DoctorProvider>().addDoctorsListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: controller,
      tabs: [
        PersistentTabConfig(
          screen: const FrontPage(),
          item: ItemConfig(
            icon: const Icon(Icons.home_filled),
            title: "Home",
            activeForegroundColor: const Color.fromARGB(255, 151, 71, 255),
            inactiveForegroundColor: const Color.fromARGB(111, 151, 71, 255),
          ),
        ),
        PersistentTabConfig(
          screen: const PlaceHolderPage(),
          item: ItemConfig(
            icon: const Icon(Icons.wallet),
            title: "Wallet",
            activeForegroundColor: const Color.fromARGB(255, 151, 71, 255),
            inactiveForegroundColor: const Color.fromARGB(111, 151, 71, 255),
          ),
        ),
        PersistentTabConfig(
          screen: const PlaceHolderPage(),
          item: ItemConfig(
            icon: Image.asset('assets/go_icon.png'),
            title: "Go4Life",
            activeForegroundColor: const Color.fromARGB(255, 151, 71, 255),
            inactiveForegroundColor: const Color.fromARGB(111, 151, 71, 255),
          ),
        ),
        PersistentTabConfig(
          screen: const CartPage(),
          item: ItemConfig(
            icon: const Icon(Icons.shopping_cart),
            title: "Cart",
            activeForegroundColor: const Color.fromARGB(255, 151, 71, 255),
            inactiveForegroundColor: const Color.fromARGB(111, 151, 71, 255),
          ),
        ),
        PersistentTabConfig(
          screen: const PlaceHolderPage(),
          item: ItemConfig(
            icon: const Icon(Icons.person),
            title: "Profile",
            activeForegroundColor: const Color.fromARGB(255, 151, 71, 255),
            inactiveForegroundColor: const Color.fromARGB(111, 151, 71, 255),
          ),
        ),
      ],
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      // decoration: NavBarDecoration(
      //   borderRadius: BorderRadius.circular(10.0),
      //   colorBehindNavBar: Colors.white,
      // ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      navBarBuilder: (navBarConfig) => Style6BottomNavBar(
        navBarConfig: navBarConfig,
        itemAnimationProperties: const ItemAnimation(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ), // Choose the nav bar style with this property.
    );
  }
}
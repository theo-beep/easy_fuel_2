//HomePage()
import 'package:easy_fuel_2/UserInterface/main_home_page.dart';
import 'package:easy_fuel_2/UserInterface/map_page.dart';
import 'package:easy_fuel_2/UserInterface/onboarding_page.dart';
import 'package:easy_fuel_2/UserInterface/order_history_page.dart';
import 'package:easy_fuel_2/UserInterface/profile_page.dart';
import 'package:easy_fuel_2/UserInterface/request_fuel.dart';
import 'package:easy_fuel_2/Widgets/categoryCard.dart';
import 'package:easy_fuel_2/Widgets/search_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_fuel_2/ColorConstants.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../Widgets/categoryCard2.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();


  void saveLoggedInUser(a) async{
    FirebaseAuth auth = FirebaseAuth.instance;
    final prefs = await SharedPreferences.getInstance();
    String? userEmail =  auth.currentUser?.email;
    await prefs.setString('userEmail',userEmail!);
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();
  PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 3,
      child:
   AdvancedDrawer(
  backdropColor: secondaryColor,
  controller: _advancedDrawerController,
  animationCurve: Curves.easeInOut,
  animationDuration: const Duration(milliseconds: 300),
    animateChildDecoration: true,
    rtlOpening: false,
    disabledGestures: false,
    childDecoration: const BoxDecoration(
      // NOTICE: Uncomment if you want to add shadow behind the page.
      // Keep in mind that it may cause animation jerks.
      // boxShadow: <BoxShadow>[
      //   BoxShadow(
      //     color: Colors.black12,
      //     blurRadius: 0.0,
      //   ),
      // ],
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    child: Scaffold(
      appBar: AppBar(
        bottom: const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_transit)),
            Tab(icon: Icon(Icons.directions)),
          ],
        ),
        toolbarHeight: 48,
        backgroundColor: primaryColor,
        elevation: 0.0,
        leading: IconButton(
          onPressed: _handleMenuButtonPressed,
          icon: ValueListenableBuilder<AdvancedDrawerValue>(
            valueListenable: _advancedDrawerController,
            builder: (_, value, __) {
              return AnimatedSwitcher(
                duration: Duration(milliseconds: 250),
                child: Icon(
                  value.visible ? Icons.clear : Icons.menu,
                  key: ValueKey<bool>(value.visible),
                ),
              );
            },
          ),
        ),
      ),
      body:
      TabBarView(
          children: [
            MainHomePage(),
            OrderHistory(),
            MapPage(),
          ]),
    ),
    drawer: SafeArea(
      child: Container(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 128.0,
                height: 128.0,
                margin: const EdgeInsets.only(
                  top: 24.0,
                  bottom: 64.0,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/flutter_logo.png',
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.home),
                title: const Text('Home'),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UserProfile()));
                },
                leading: const Icon(Icons.account_circle_rounded),
                title: const Text('Profile'),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RequestFuel()));
                },
                leading: const Icon(Icons.shopping_cart),
                title: const Text('Order'),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RequestFuel()));
                },
                leading: const Icon(Icons.book_outlined),
                title: const Text('Order History'),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  onboard()));
                },
                leading: const Icon(Icons.info_rounded),
                title: const Text('About'),
              ),
              const Spacer(),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: const Text('Terms of Service | Privacy Policy'),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  )

  );

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }

  List<Widget> _buildScreens() {
    return [
      HomePage(),
      const RequestFuel()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.settings),
        title: ("Order Fuel"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

}
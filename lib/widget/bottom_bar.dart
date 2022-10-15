import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/constant/global_variable.dart';
import 'package:badges/badges.dart';
import 'package:untitled/home.dart';
import 'package:untitled/provider/user_provider.dart';
import 'package:untitled/screen/account_screen.dart';
import 'package:untitled/screen/cart_screen.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/bottom_bar';
  //const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int n = 0;
  double bottom_width = 42;
  double bottom_border = 5;

//final userCartlen=context.watch<UserProvider>()user.cart.length

  updatePage(int _page) {
    setState(() {
      n = _page;
    });
  }

  List<Widget> pages = [
    Home(),
    Account(),
    CartScreen()
    // Center(
    //   child: Text('Cart Page'),
    // )
  ];
  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;

    return Scaffold(
      body: pages[n],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: n,
        selectedItemColor: Global.selectedNavBarColor,
        unselectedItemColor: Global.unselectedNavBarColor,
        backgroundColor: Global.backgroundColor,
        iconSize: 27,
        onTap: updatePage,
        items: [
          BottomNavigationBarItem(
              icon: Container(
                width: bottom_width,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: n == 0
                                ? Global.selectedNavBarColor
                                : Global.backgroundColor,
                            width: bottom_border))),
                child: Icon(Icons.home_outlined),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Container(
                width: bottom_width,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: n == 1
                                ? Global.selectedNavBarColor
                                : Global.backgroundColor,
                            width: bottom_border))),
                child: Icon(Icons.person),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Container(
                width: bottom_width,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: n == 2
                                ? Global.selectedNavBarColor
                                : Global.backgroundColor,
                            width: bottom_border))),
                child: Badge(
                    elevation: 0,
                    badgeColor: Colors.white,
                    badgeContent: Text(userCartLen.toString()),
                    child: Icon(Icons.add_shopping_cart)),
              ),
              label: ''),
        ],
      ),
    );
  }
}

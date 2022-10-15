import 'package:untitled/Admin/analytics_screen.dart';
import 'package:untitled/Admin/order_screen.dart';
import 'package:untitled/Admin/post_screen.dart';
import 'package:untitled/constant/global_variable.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int page = 0;
  double bottom_width = 42;
  double bottom_border = 5;

  updatePage(int _page) {
    print(_page);
    setState(() {
      page = _page;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [PostScreen(), AnalyticsScreen(), OrdersScreen()];

    return Scaffold(
      body: pages[page],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: Global.appBarGradient,
            ),
          ),
          title: Text('Admin'),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [

          //   ],
          // ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: page,
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
                            color: page == 0
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
                            color: page == 1
                                ? Global.selectedNavBarColor
                                : Global.backgroundColor,
                            width: bottom_border))),
                child: Icon(Icons.analytics),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Container(
                  width: bottom_width,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: page == 2
                                  ? Global.selectedNavBarColor
                                  : Global.backgroundColor,
                              width: bottom_border))),
                  child: Icon(Icons.analytics)),
              label: ''),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:untitled/Admin/add_product.dart';
import 'package:untitled/home.dart';
import 'package:untitled/screen/address_screen.dart';
import 'package:untitled/screen/auth_screen.dart';
import 'package:untitled/screen/category_page.dart';
import 'package:untitled/screen/category_screen.dart';
import 'package:untitled/screen/order_detail.dart';
import 'package:untitled/screen/product_detail_screen.dart';
import 'package:untitled/screen/search_screen.dart';
import 'package:untitled/widget/bottom_bar.dart';

import 'model/order.dart';
import 'model/product_model.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => AuthScreen());
    case BottomBar.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => BottomBar());
    case Home.routeName:
      return MaterialPageRoute(settings: routeSettings, builder: (_) => Home());

    case AddProduct.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => AddProduct());

    case AddressScreen.routeName:
      var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddressScreen(
          totalAmount: totalAmount,
        ),
      );

    case CategoryScreen.routeName:
      var category = routeSettings.arguments as String;

      return MaterialPageRoute(
        // var category=routeSettings.argumment;

        settings: routeSettings,
        builder: (_) => CategoryScreen(
          category: category,
        ),
      );

    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => SearchScreen(
                searchQuery: searchQuery,
              ));
    case ProductDetail.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProductDetail(
          product: product,
        ),
      );

    case OrderDetailScreen.routeName:
      var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => OrderDetailScreen(
          order: order,
        ),
      );
    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text('Error occured'),
                ),
              ));
  }
}

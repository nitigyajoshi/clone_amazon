import 'package:flutter/material.dart';
import 'package:untitled/constant/global_variable.dart';
import 'package:untitled/screen/product_detail_screen.dart';
import 'package:untitled/service/home_services.dart';
import 'package:untitled/widget/loder.dart';

import '../model/product_model.dart';

class CategoryScreen extends StatefulWidget {
  static const String routeName = '/category-deals';
  final String category;
  const CategoryScreen({super.key, required this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Product>? productList;
  HomeServices homeServices = HomeServices();
  @override
  void initState() {
    fetchCategoryProduct();

    // productList = await homeServices.fetchCategoryProducts(
    // context: context, category: widget.category);
    // TODO: implement initState
    super.initState();
  }

  fetchCategoryProduct() async {
    productList = await homeServices.fetchCategoryProducts(
        context: context, category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: Global.appBarGradient,
            ),
          ),
          title: Text(
            widget.category,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: productList == null
          ? Loader()
          : GestureDetector(
              onTap: () {},
              child: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(
                          height: 170,
                          child: GridView.builder(
                              itemCount: productList!.length,
                              padding: EdgeInsets.only(left: 13),
                              scrollDirection: Axis.horizontal,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      childAspectRatio: 1.4,
                                      mainAxisSpacing: 10),
                              itemBuilder: (context, index) {
                                final product = productList![index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      ProductDetail.routeName,
                                      arguments: product,
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 130,
                                        //child: DecoratedBox(

                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.black12,
                                              width: 0.5,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Image.network(
                                              product.images[0],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              })),

                      //                       SizedBox(
                      // height: 130,
                      // //child: DecoratedBox(

                      //          child: DecoratedBox(
                      //                                 decoration: BoxDecoration(
                      //                                   border: Border.all(
                      //                                     color: Colors.black12,
                      //                                     width: 0.5,
                      //                                   ),
                      //                                 ),
                      //                                 child: Padding(
                      //                                   padding: const EdgeInsets.all(10),
                      //                                   child: Image.network(
                      //                                     productList.images[index],
                      //                                   ),
                      //                                 ),
                      //                               ),)
                      //),                     // )
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}

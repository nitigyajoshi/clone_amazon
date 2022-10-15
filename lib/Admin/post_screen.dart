import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:untitled/Admin/add_product.dart';
import 'package:untitled/Admin/admin_service.dart';
import 'package:untitled/widget/loder.dart';

import '../constant/global_variable.dart';
import '../model/product_model.dart';
import '../widget/single_item.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Product> products = [];
  AdminServices adminServices = AdminServices();
  @override
  void initState() {
    fetchAllProduct();
    // TODO: implement initState
  }

  fetchAllProduct() async {
    products = await adminServices.fetchAllProduct(context);

    setState(() {});
  }

  void deleteProduct(Product product, int index) {
    adminServices.deleteProduct(
      context: context,
      product: product,
      onSuccess: () {
        products.removeAt(index);
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? Loader()
        : Scaffold(
            body: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  final productData = products[index];
                  return Column(
                    children: [
                      SizedBox(
                        height: 140,
                        child: SingleProduct(
                          image: productData.images[0],
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Text(
                                productData.name,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                deleteProduct(productData, index);
                              },
                              //=> deleteProduct(productData, index),
                              icon: const Icon(
                                Icons.delete_outline,
                              ),
                            )
                          ])
                    ],
                  );
                }),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, AddProduct.routeName, (route) => false);
              },
              tooltip: 'Add Item',
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}

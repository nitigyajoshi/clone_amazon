import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:untitled/Admin/admin_service.dart';
import 'package:untitled/constant/global_variable.dart';
import 'package:untitled/constant/utils.dart';
import 'package:untitled/widget/textfield.dart';

import '../widget/customwidget.dart';

class AddProduct extends StatefulWidget {
  static const String routeName = '/addProduct';
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController _name = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _price = TextEditingController();
  TextEditingController _quantity = TextEditingController();
  final _addProductFormKey = GlobalKey<FormState>();
  AdminServices adminServices = AdminServices();

  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion'
  ];
  String category = 'Mobiles';
  List<File> images = [];
  selectImage() async {
    var res = await pickimage();
    setState(() {
      images = res;
    });
  }

  void sellProduct() {
    if (_addProductFormKey.currentState!.validate() || images.isNotEmpty) {
      adminServices.sellProduct(
          context: context,
          name: _name.text,
          description: _description.text,
          price: double.parse(_price.text),
          quantity: double.parse(_quantity.text),
          category: category,
          images: images);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: Global.appBarGradient,
            ),
          ),
          title: Text('Add Product'),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [

          //   ],
          // ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _addProductFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  images.isNotEmpty
                      ? CarouselSlider(
                          items: images.map(
                            (i) {
                              return Builder(
                                builder: (BuildContext context) => Image.file(
                                  i,
                                  fit: BoxFit.cover,
                                  height: 200,
                                ),
                              );
                            },
                          ).toList(),
                          options: CarouselOptions(
                            autoPlay: true,
                            viewportFraction: 1,
                            height: 200,
                          ),
                        )
                      : GestureDetector(
                          onTap: selectImage,
                          child: DottedBorder(
                            dashPattern: [10, 4],
                            strokeCap: StrokeCap.round,
                            borderType: BorderType.RRect,
                            child: Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.folder_open,
                                      size: 40,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Add Image or file')
                                  ]),
                            ),
                          ),
                        ),
                  TextFieldBox(controller: _name, hinttext: 'Name of product'),
                  TextFieldBox(
                    controller: _description,
                    hinttext: 'description',
                    line: 7,
                  ),
                  TextFieldBox(controller: _price, hinttext: 'product price'),
                  TextFieldBox(controller: _quantity, hinttext: 'quantity'),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: DropdownButton(
                        icon: Icon(Icons.arrow_drop_down),
                        value: category,
                        items: productCategories.map((String item) {
                          return DropdownMenuItem(
                              value: item, child: Text(item));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            category = value!;
                          });
                        }),
                  ),
                  CostomButton(
                    text: 'Sell',
                    ontap: sellProduct,
                  )
                ],
              ),
            )),
      ),
    );
  }
}

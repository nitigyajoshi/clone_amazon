import 'package:flutter/material.dart';
import 'package:untitled/screen/category_page.dart';

import '../constant/global_variable.dart';

class TopCategories extends StatefulWidget {
  const TopCategories({Key? key}) : super(key: key);
  static const String routeName = '/category-deals';

  @override
  State<TopCategories> createState() => _TopCategoriesState();
}

class _TopCategoriesState extends State<TopCategories> {
  // void navigateToCategoryPage(BuildContext context, String category) {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: Global.categoryImages.length,
        scrollDirection: Axis.horizontal,
        itemExtent: 75,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, TopCategories.routeName,
                  arguments: Global.categoryImages[index]['title']);
            },
            // onTap: () => navigateToCategoryPage(
            //   context,
            //   Global.categoryImages[index]['title']!,
            // ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      Global.categoryImages[index]['image']!,
                      fit: BoxFit.cover,
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
                Text(
                  Global.categoryImages[index]['title']!,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                // SizedBox(
                //     height: 170,
                //     child: GridView.builder(
                //         scrollDirection: Axis.horizontal,
                //         gridDelegate:
                //             const SliverGridDelegateWithFixedCrossAxisCount(
                //                 crossAxisCount: 1,
                //                 childAspectRatio: 1.4,
                //                 mainAxisSpacing: 10),
                //         itemBuilder: (context, index) {
                //           return Text('');
                //         })
                //         ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../constant/global_variable.dart';

class Stars extends StatelessWidget {
  // final double rating;
  const Stars({
    Key? key,
    required double rating,
    //  required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      direction: Axis.horizontal,
      itemCount: 5,
      rating: 4,
      //rating,
      itemSize: 15,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Global.secondaryColor,
      ),
    );
  }
}

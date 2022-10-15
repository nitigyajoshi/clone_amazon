import 'package:flutter/material.dart';
import 'package:untitled/service/account_service.dart';
import 'package:untitled/widget/account_button.dart';
import 'package:untitled/widget/orders.dart';

class TopButton extends StatelessWidget {
  const TopButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              text: 'Your Order',
              onTap: () {},
            ),
            AccountButton(
              text: 'Turn Seller ',
              onTap: () {},
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            AccountButton(
              text: 'logout ',
              onTap: () {
                AccountServices().logOut(context);
              },
            ),
            AccountButton(
              text: 'your wish list ',
              onTap: () {},
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Orders()
      ],
    );
  }
}

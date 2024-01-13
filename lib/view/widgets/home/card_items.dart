import 'package:flutter/material.dart';
import 'package:waleed_asro_shopping_getx_api/utils/theme.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/text_utils.dart';

class CardItems extends StatelessWidget {
  const CardItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 0.8,
              mainAxisSpacing: 9,
              crossAxisSpacing: 6,
              maxCrossAxisExtent: 200),
          itemBuilder: (context, index) {
            return buildCardItems();
          }),
    );
  }

  Widget buildCardItems() {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(15), boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5),
        ]),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_outline,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                "https://plus.unsplash.com/premium_photo-1684348962314-64fa628992f0?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15.0, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$15",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 20,
                    width: 45,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(right: 2, left: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextUtils(
                              text: "4.7",
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              underLine: TextDecoration.none),
                          Icon(
                            Icons.star,
                            size: 13,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/utils/theme.dart';

class SizeList extends StatefulWidget {
  const SizeList({super.key});

  @override
  State<SizeList> createState() => _SizeListState();
}

class _SizeListState extends State<SizeList> {
  final List<String> sizeList = ["S", "M", "L", "Xl", "XXL"];
  var currentSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  currentSelected = index;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: Get.isDarkMode
                      ? currentSelected == index
                          ? pinkClr.withOpacity(0.5)
                          : Colors.white
                      : currentSelected == index
                          ? mainColor.withOpacity(0.5)
                          : Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border:
                      Border.all(color: Colors.grey.withOpacity(0.4), width: 2),
                ),
                child: Text(
                  sizeList[index],
                  style: TextStyle(
                      color: currentSelected == index
                          ? Colors.black
                          : Colors.black,
                      fontWeight: currentSelected == index
                          ? FontWeight.bold
                          : FontWeight.normal),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 10,
            );
          },
          itemCount: sizeList.length),
    );
  }
}

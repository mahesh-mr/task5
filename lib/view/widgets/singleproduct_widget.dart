


import 'package:flutter/material.dart';
import 'package:task5/view/screen/style/size.dart';
import 'package:task5/view/widgets/custom_text.dart';

class SingleProductDetailedWidget extends StatelessWidget {
  const SingleProductDetailedWidget({
    super.key,
    required this.brand,
    required this.category,
    required this.description,
    required this.imagUrl,
    required this.name,
    required this.price,
    required this.percentage,
  });

  final String imagUrl;
  final String brand;
  final String name;
  final String category;
  final String price;
  final String description;
  final String percentage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 450,
          width: double.infinity,
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    image: DecorationImage(
                        image: NetworkImage(
                          imagUrl,
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
                h10,
                CustomTest(
                  title: category,
                ),
                h10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTest(
                      title: name,
                    ),
                    CustomTest(
                      title: price,
                    ),
                  ],
                ),
                h10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTest(title: brand),
                    CustomTest(title: percentage),
                  ],
                ),
                h10,
                CustomTest(title: description),
                h10,
              ],
            ),
          ),
        ),
        // Add other product details
      ],
    );
    ;
  }
}

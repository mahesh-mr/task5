// screens/product_details_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task5/controller/controller/controller.dart';
import 'package:task5/view/widgets/custom_appbar.dart';
import 'package:task5/view/widgets/singleproduct_widget.dart';

// ignore: must_be_immutable
class ProductDetailsScreen extends StatelessWidget {
  int index;
  ProductDetailsScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductProvider>(context, listen: false).fecthProductData();
    });

    return Scaffold(
        appBar: CustomAppbar(),
        body: Consumer<ProductProvider>(builder: (context, value, child) {
          if (value.isLoding) {
            const Center(
              child: CircularProgressIndicator(),
            );
          }
          final productdata = value.productModel[index];
          return SingleProductDetailedWidget(
            brand: productdata.brand!,
            category: productdata.category!,
            description: productdata.description!,
            imagUrl: productdata.images![0],
            name: productdata.title!,
            price: "₹ ${productdata.price.toString()}",
            percentage: "${productdata.discountPercentage.toString()} % offer",
          );
        }));
  }
}

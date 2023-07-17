// screens/product_list_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task5/controller/controller/controller.dart';
import 'package:task5/controller/controller/search_controll.dart';
import 'package:task5/view/screen/products_details.dart';
import 'package:task5/view/screen/style/colors.dart';
import 'package:task5/view/screen/style/size.dart';

import '../../models/product_model.dart';

// ignore: must_be_immutable
class ProductListScreen extends StatelessWidget {
  ProductListScreen({super.key});
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final searchProvider = Provider.of<SearchProvider>(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductProvider>(context, listen: false).fecthProductData();
    });
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: const Size.square(50),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: double.infinity,
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "Search",
                      prefixIcon: const Icon(
                        Icons.search,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          searchController.text = '';
                        },
                        icon: const Icon(
                          Icons.close,
                        ),
                      )),
                ),
              ),
            )),
        centerTitle: true,
        backgroundColor: whiteColor,
        elevation: 0,
        title: const Text(
          'MyMart',
          style: TextStyle(color: blackColor),
        ),
      ),
      body: Consumer<ProductProvider>(builder: (context, value, child) {
        if (value.isLoding) {
          const Center(
            child: CircularProgressIndicator(),
          );
        }

        final List<Products> products = searchController.text.isEmpty
            ? productProvider.productModel
            : searchProvider.productModel
                .where((product) => product.title!
                    .toLowerCase()
                    .contains(searchController.text))
                .toList();


        return GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 210,
                childAspectRatio: 2 / 2.4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20),
            itemCount: products.length,
            itemBuilder: (BuildContext ctx, index) {
              final productdata = products[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailsScreen(index: index)),
                    );
                  },
                  child: Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: blackColor)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 120,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            image: DecorationImage(
                                image: NetworkImage(
                                  productdata.images![0],
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        h10,
                        textFeild(productdata.title!),
                        h10,
                        textFeild(productdata.brand!),
                        h10,
                        textFeild("₹ ${productdata.price.toString()}"),
                      ],
                    ),
                  ),
                ),
              );
            });
      }),
    );
  }

  Padding textFeild(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

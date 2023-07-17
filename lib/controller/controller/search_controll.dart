// // providers/product_provider.dart

import 'package:flutter/foundation.dart';
import 'package:task5/controller/service/product_service/searchService.dart';
import 'package:task5/models/product_model.dart';

import '../service/product_service/product_service.dart';

class SearchProvider with ChangeNotifier {
  List<Products> productModel = <Products>[];
  bool isLoding = true;

  Future<List<Products>> searchProductData(String query) async {
    try {
      var data = await SearchProductService.searchProducts(query);
      isLoding = false;
      print("$data =============11");
      productModel = data;
      notifyListeners();

      return productModel;
    } catch (e) {
      print(e);
      print('catch bloc called');
      isLoding = false;
    }
    notifyListeners();
    return [];
  }
}

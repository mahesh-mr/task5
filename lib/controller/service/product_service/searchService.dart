import 'package:task5/controller/service/baseurl.dart';

import '../../../models/product_model.dart';

class SearchProductService {
  static Future<List<Products>> searchProducts(String query) async {
    try {
      var response = await DioClient.dio.get('/products/search?q=$query');
      ProductModel model = ProductModel.fromJson(response.data);
      print(response.data);
      print(model);
      return model.products!;
    } catch (e) {
      print("$e");
    }
    return [];
  }
}

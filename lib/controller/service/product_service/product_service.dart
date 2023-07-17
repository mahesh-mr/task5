
import 'package:task5/controller/service/baseurl.dart';
import 'package:task5/models/product_model.dart';

class ProductService {
 static Future<List<Products>> fetchProducts() async {
    try {
      var response = await DioClient.dio.get('/products');
      ProductModel model = ProductModel.fromJson(response.data);
      print(response.data);
      print(model);
      return model.products!;
    } catch (e) {
      print("$e");
    }
    return [];
  }

  //single product//==
   static Future<List<Products>> fetchSingleProducts(int productId) async {
    try {
      var response = await DioClient.dio.get('/products/$productId');
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

// Future<List<ProductModel>> fetchProducts() async {
//   final response = await http.get(Uri.parse(baseUrl));
//   if (response.statusCode == 200) {
//     final List<dynamic> json = jsonDecode(response.body);
//     return json
//         .map((productJson) => ProductModel.fromJson(productJson))
//         .toList();
//   } else {
//     throw Exception('Failed to fetch products');
//   }
// }

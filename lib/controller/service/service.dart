// // services/api_service.dart

// import 'dart:convert';

// import 'package:http/http.dart' as http;

// import 'package:task5/models/product_model.dart';

// class ApiService {
//   static const String baseUrl = 'https://dummyjson.com/products';

//   Future<List<ProductModel>> fetchProducts() async {
//     final response = await http.get(Uri.parse(baseUrl));
//     if (response.statusCode == 200) {
//       final List<dynamic> json = jsonDecode(response.body);
//       return json.map((productJson) => ProductModel.fromJson(productJson)).toList();
//     } else {
//       throw Exception('Failed to fetch products');
//     }
//   }

//   Future<ProductModel> fetchProduct(int productId) async {
//     final response = await http.get(Uri.parse('$baseUrl/$productId'));
//     if (response.statusCode == 200) {
//       final dynamic json = jsonDecode(response.body);
//       return ProductModel.fromJson(json);
//     } else {
//       throw Exception('Failed to fetch product');
//     }
//   }

//   Future<List<ProductModel>> searchProducts(String query) async {
//     final response = await http.get(Uri.parse('$baseUrl/search?q=$query'));
//     if (response.statusCode == 200) {
//       final List<dynamic> json = jsonDecode(response.body);
//       return json.map((productJson) => ProductModel.fromJson(productJson)).toList();
//     } else {
//       throw Exception('Failed to search products');
//     }
//   }

//   // Future<List<Category>> fetchCategories() async {
//   //   final response = await http.get(Uri.parse('$baseUrl/categories'));
//   //   if (response.statusCode == 200) {
//   //     final List<dynamic> json = jsonDecode(response.body);
//   //     return json.map((categoryJson) => Category.fromJson(categoryJson)).toList();
//   //   } else {
//   //     throw Exception('Failed to fetch categories');
//   //   }
//   // }

//   Future<List<ProductModel>> fetchProductsByCategory(int categoryId) async {
//     final response = await http.get(Uri.parse('$baseUrl/category/$categoryId'));
//     if (response.statusCode == 200) {
//       final List<dynamic> json = jsonDecode(response.body);
//       return json.map((productJson) => ProductModel.fromJson(productJson)).toList();
//     } else {
//       throw Exception('Failed to fetch products by category');
//     }
//   }

//   Future<void> addProduct(ProductModel product) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/add'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode(product),
//     );
//     if (response.statusCode != 201) {
//       throw Exception('Failed to add product');
//     }
//   }
// }

// providers/product_provider.dart

import 'package:flutter/foundation.dart';
import 'package:task5/controller/service/product_service/searchService.dart';
import 'package:task5/models/product_model.dart';

import '../service/product_service/product_service.dart';

class ProductProvider with ChangeNotifier {
  List<Products> productModel = <Products>[];
  bool isLoding = true;

  Future<List<Products>> fecthProductData() async {
    try {
      var data = await ProductService.fetchProducts();
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

  Future<List<Products>> fecthSingleProductData(int productId) async {
    try {
      var data = await ProductService.fetchSingleProducts(productId);
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

  // final ApiService _apiService = ApiService();
  // List<ProductModel> _products = [];
  // List<Category> _categories = [];
  // ProductModel? _selectedProduct;
  // String _searchQuery = '';

  // List<ProductModel> get products => _products;
  // List<Category> get categories => _categories;
  // ProductModel? get selectedProduct => _selectedProduct;
  // String get searchQuery => _searchQuery;

  // Future<void> fetchProducts() async {
  //   try {
  //     _products = await _apiService.fetchProducts();
  //     notifyListeners();
  //   } catch (error) {
  //     print('Error fetching products: $error');
  //   }
  // }

  // Future<void> searchProducts(String query) async {
  //   try {
  //     _searchQuery = query;
  //     if (query.isNotEmpty) {
  //       _products = await _apiService.searchProducts(query);
  //     } else {
  //       _products = await _apiService.fetchProducts();
  //     }
  //     notifyListeners();
  //   } catch (error) {
  //     print('Error searching products: $error');
  //   }
  // }

  // // Future<void> fetchCategories() async {
  // //   try {
  // //     _categories = await _apiService.fetchCategories();
  // //     notifyListeners();
  // //   } catch (error) {
  // //     print('Error fetching categories: $error');
  // //   }
  // // }

  // Future<void> fetchProductsByCategory(int categoryId) async {
  //   try {
  //     _products = await _apiService.fetchProductsByCategory(categoryId);
  //     notifyListeners();
  //   } catch (error) {
  //     print('Error fetching products by category: $error');
  //   }
  // }

  // Future<void> selectProduct(int productId) async {
  //   try {
  //     _selectedProduct = await _apiService.fetchProduct(productId);
  //     notifyListeners();
  //   } catch (error) {
  //     print('Error selecting product: $error');
  //   }
  // }

  // Future<void> addProduct(ProductModel product) async {
  //   try {
  //     await _apiService.addProduct(product);
  //     fetchProducts(); // Refresh the product list after adding a new product
  //   } catch (error) {
  //     print('Error adding product: $error');
  //   }
  // }


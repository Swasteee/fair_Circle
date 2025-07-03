import 'package:faircircle/data/model/product_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductLocalDataSource {
  final Box<ProductModel> box;

  ProductLocalDataSource(this.box);

  List<ProductModel> getAll() => box.values.toList();

  Future<void> add(ProductModel product) async {
    await box.add(product);
  }
}

class ProductRemoteDataSource {
  final String apiUrl;
  ProductRemoteDataSource({required this.apiUrl});

  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data
          .map(
            (json) => ProductModel(
              title: json['title'] ?? '',
              imagePath: json['imagePath'] ?? '',
            ),
          )
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}

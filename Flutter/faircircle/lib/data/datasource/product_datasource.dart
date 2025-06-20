import 'package:faircircle/data/model/product_model.dart';
import 'package:hive_flutter/hive_flutter.dart';


class ProductLocalDataSource {
  final Box<ProductModel> box;

  ProductLocalDataSource(this.box);

  List<ProductModel> getAll() => box.values.toList();

  Future<void> add(ProductModel product) async {
    await box.add(product);
  }
}

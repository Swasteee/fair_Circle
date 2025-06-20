import 'package:faircircle/data/datasource/product_datasource.dart';
import 'package:faircircle/data/model/product_model.dart';
import 'package:faircircle/domain/entities/product_entity.dart';


class ProductRepositoryImpl extends ProductRepository {
  final ProductLocalDataSource localDataSource;

  ProductRepositoryImpl(this.localDataSource);

  List<ProductEntity> getAllProducts() {
    return localDataSource.getAll();
  }

  Future<void> addProduct(ProductEntity product) async {
    final model = ProductModel(
      title: product.title,
      imagePath: product.imagePath,
    );
    await localDataSource.add(model);
  }
}

class ProductRepository {
}



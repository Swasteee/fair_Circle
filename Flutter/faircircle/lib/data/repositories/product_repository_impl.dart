import 'package:faircircle/data/datasource/product_datasource.dart';
import 'package:faircircle/data/model/product_model.dart';
import 'package:faircircle/domain/entities/product_entity.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductLocalDataSource? localDataSource;
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({this.localDataSource, required this.remoteDataSource});

  List<ProductEntity> getAllProducts() {
    if (localDataSource == null) return [];
    return localDataSource!.getAll();
  }

  Future<void> addProduct(ProductEntity product) async {
    if (localDataSource == null) return;
    final model = ProductModel(
      title: product.title,
      imagePath: product.imagePath,
    );
    await localDataSource!.add(model);
  }

  Future<List<ProductEntity>> fetchProductsFromApi() async {
    return await remoteDataSource.fetchProducts();
  }
}

class ProductRepository {}

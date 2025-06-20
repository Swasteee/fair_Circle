import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/entities/product_entity.dart';



@HiveType(typeId: 0)
class ProductModel extends ProductEntity {
  @override
  @HiveField(0)
  final String title;

  @override
  @HiveField(1)
  final String imagePath;

  ProductModel({required this.title, required this.imagePath})
    : super(title: title, imagePath: imagePath);
}

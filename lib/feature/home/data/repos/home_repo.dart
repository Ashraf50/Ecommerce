import 'package:Ecommerce/core/errors/failure.dart';
import 'package:Ecommerce/core/model/product_model.dart';
import 'package:either_dart/either.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductModel>>> fetchAllProducts();

  Future<Either<Failure, List<ProductModel>>> fetchAllCategories(
      {required String category});
}

import 'package:Ecommerce/core/errors/failure.dart';
import 'package:Ecommerce/core/model/product_model.dart';
import 'package:Ecommerce/core/utils/api_services.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  ApiServices apiService;
  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<ProductModel>>> fetchAllProducts() async {
    try {
      var data =
          await apiService.get(endpoint: "https://fakestoreapi.com/products");
      List<ProductModel> productList = [];
      for (int i = 0; i < data.length; i++) {
        productList.add(ProductModel.fromJson(data[i]));
      }
      return Right(productList);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> fetchAllCategories(
      {required String category}) async {
    try {
      var data = await apiService.get(
          endpoint: "https://fakestoreapi.com/products/category/$category");
      List<ProductModel> productList = [];
      for (int i = 0; i < data.length; i++) {
        productList.add(ProductModel.fromJson(data[i]));
      }
      return Right(productList);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }
}

import 'package:Ecommerce/core/model/product_model.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchSuccess extends SearchState {
  List<ProductModel> products;
  SearchSuccess(this.products);
}

class SearchFailure extends SearchState {}

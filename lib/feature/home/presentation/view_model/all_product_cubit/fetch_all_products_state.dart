part of 'fetch_all_products_cubit.dart';

sealed class FetchAllProductsState {}

final class FetchAllProductsInitial extends FetchAllProductsState {}

final class FetchAllProductsLoading extends FetchAllProductsState {}

final class FetchAllProductsSuccess extends FetchAllProductsState {
  final List<ProductModel> products;
  FetchAllProductsSuccess({required this.products});
}

final class FetchAllProductsFailure extends FetchAllProductsState {
  final String errMessage;
  FetchAllProductsFailure({required this.errMessage});
}

part of 'fetch_all_category_cubit.dart';

sealed class FetchAllCategoryState {}

final class FetchAllCategoryInitial extends FetchAllCategoryState {}

final class FetchAllCategoryLoading extends FetchAllCategoryState {}

final class FetchAllCategorySuccess extends FetchAllCategoryState {
  final List<ProductModel> products;
  FetchAllCategorySuccess({required this.products});
}

final class FetchAllCategoryFailure extends FetchAllCategoryState {
  final String errMessage;
  FetchAllCategoryFailure({required this.errMessage});
}

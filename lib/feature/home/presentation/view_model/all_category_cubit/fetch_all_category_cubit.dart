import 'package:Ecommerce/core/model/category_model.dart';
import 'package:Ecommerce/core/model/product_model.dart';
import 'package:Ecommerce/feature/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'fetch_all_category_state.dart';

class FetchAllCategoryCubit extends Cubit<FetchAllCategoryState> {
  FetchAllCategoryCubit(this.homeRepo, this.category) : super(FetchAllCategoryInitial());

  final HomeRepo homeRepo;
  final CategoryModel category;

  Future<void> fetchAllCategory() async {
    emit(FetchAllCategoryLoading());
    var result = await homeRepo.fetchAllCategories(category: category.categoryName );
    result.fold(
      (failure) {
        emit(
          FetchAllCategoryFailure(errMessage: failure.errMessage),
        );
      },
      (product) {
        emit(
          FetchAllCategorySuccess(products: product),
        );
      },
    );
  }
}

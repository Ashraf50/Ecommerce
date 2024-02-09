import 'package:Ecommerce/core/model/product_model.dart';
import 'package:Ecommerce/feature/home/data/repos/home_repo.dart';
import 'package:bloc/bloc.dart';


part 'fetch_all_products_state.dart';

class FetchAllProductsCubit extends Cubit<FetchAllProductsState> {
  FetchAllProductsCubit(this.homeRepo) : super(FetchAllProductsInitial());

  
  final HomeRepo homeRepo;

  Future<void> fetchAllProduct() async {
    emit(FetchAllProductsLoading());
    var result = await homeRepo.fetchAllProducts();
    result.fold(
      (failure) {
        emit(
          FetchAllProductsFailure(errMessage: failure.errMessage),
        );
      },
      (product) {
        emit(
          FetchAllProductsSuccess(products: product),
        );
      },
    );
}
}
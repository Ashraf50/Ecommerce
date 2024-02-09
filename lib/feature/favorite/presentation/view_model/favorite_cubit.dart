import 'package:Ecommerce/core/model/product_model.dart';
import 'package:Ecommerce/feature/favorite/presentation/view_model/favorite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  static FavoriteCubit get(context) => BlocProvider.of(context);

  List selectedProduct = [];

  add(ProductModel product) {
    selectedProduct.add(product);
    emit(UpdateFavSelectedProduct());
  }

  bool isSelected(ProductModel product) {
    final isSelected = selectedProduct.contains(product);
    return isSelected;
  }

  delete(ProductModel product) {
    selectedProduct.remove(product);
    emit(UpdateFavSelectedProduct());
  }
}

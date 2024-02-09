import 'package:Ecommerce/core/model/product_model.dart';
import 'package:Ecommerce/feature/cart/presentation/view_model/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(HomeInitial());
  static CartCubit get(context) => BlocProvider.of(context);

  List selectedProduct = [];
  double price = 0;

  add(ProductModel product) {
    selectedProduct.add(product);
    emit(UpdateSelectedProduct());
    price += product.price.round();
    emit(UpdatePrice());
  }

  delete(ProductModel product) {
    selectedProduct.remove(product);
    emit(UpdateSelectedProduct());
    price -= product.price.round();
    emit(UpdatePrice());
  }
}

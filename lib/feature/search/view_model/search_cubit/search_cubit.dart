import 'package:Ecommerce/core/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<List<ProductModel>> {
  SearchCubit() : super([]);

  void searchCategory(String query) {
    List<ProductModel> filteredCategory = state
        .where((product) => (product.title!.toLowerCase().contains(query)))
        .toList();
    emit(filteredCategory);
  }
}

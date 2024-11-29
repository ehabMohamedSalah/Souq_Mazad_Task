// lib/blocs/product_bloc.dart
import 'package:e_commerce_task/Domain_layer/usecase/ProductsUsecase.dart';
import 'package:e_commerce_task/data_layer/model/product_model.dart';
import 'package:e_commerce_task/data_layer/repo/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductsUsecase productsUsecase;


  ProductBloc(this.productsUsecase) : super(ProductLoadingState()) {
    on<FetchProductsEvent>((event, emit) async {
      emit(ProductLoadingState());

      var response = await productsUsecase.call();
      response.fold(
            (products) => emit(ProductLoadedState(products)),
            (error) => emit(ProductErrorState(error)),
      );
    });

    on<SelectProductEvent>((event, emit) {
      emit(ProductDetailsState(event.product));
    });
  }

}

















import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Domain_layer/usecase/ProductsUsecase.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductsUsecase productsUsecase;

  ProductBloc(this.productsUsecase) : super(ProductLoadingState()) {

    on<FetchProductsEvent>((event, emit) async {
      emit(ProductLoadingState());
      try {

        final response = await productsUsecase.call();
        response.fold(
              (products) => emit(ProductLoadedState(products)), // Success
              (error) => emit(ProductErrorState(error)),        // Failure
        );
      } catch (e) {
        emit(ProductErrorState(e.toString()));
      }
    });


    on<SelectProductEvent>((event, emit) {
      emit(ProductDetailsState(event.product));
    });
  }
}

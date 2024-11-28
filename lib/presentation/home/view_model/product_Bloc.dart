// lib/blocs/product_bloc.dart
import 'package:e_commerce_task/data_layer/model/product_model.dart';
import 'package:e_commerce_task/data_layer/repo/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;
  List<Product> _allProducts = [];
  List<Product> _loadedProducts = [];
  int _currentPage = 0;
  final int _pageSize = 10;

  ProductBloc(this.repository) : super(ProductLoadingState()) {
    on<FetchProductsEvent>((event, emit) async {
      emit(ProductLoadingState());
      try {
        _allProducts = await repository.fetchProducts();
        _loadNextPage();
        emit(ProductLoadedState(_loadedProducts, _loadedProducts.length < _allProducts.length));
      } catch (e) {
        emit(ProductErrorState("Failed to load products."));
      }
    });

    on<FetchMoreProductsEvent>((event, emit) async {
      if (_loadedProducts.length < _allProducts.length) {
        _loadNextPage();
        emit(ProductLoadedState(_loadedProducts, _loadedProducts.length < _allProducts.length));
      }
    });

    on<SelectProductEvent>((event, emit) {
      emit(ProductDetailsState(event.product));
    });
  }

  void _loadNextPage() {
    final nextItems = _allProducts.skip(_currentPage * _pageSize).take(_pageSize).toList();
    _loadedProducts.addAll(nextItems);
    _currentPage++;
  }
}

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:last_exam/prod_model.dart';


// Event Definition
abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

class FetchProducts extends ProductEvent {
  const FetchProducts();
}

// State Definition
abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductLoading extends ProductState {
  const ProductLoading();
}

class ProductLoaded extends ProductState {
  final List<ProductModel> products;

  const ProductLoaded(this.products);

  @override
  List<Object?> get props => [products];
}

class ProductEmpty extends ProductState {
  const ProductEmpty();
}

class ProductError extends ProductState {
  final String message;

  const ProductError(this.message);

  @override
  List<Object?> get props => [message];
}

// Bloc Definition
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(const ProductLoading()) {
    on<FetchProducts>((event, emit) async => await _fetchProductsHandler(emit));
  }

  Future<void> _fetchProductsHandler(Emitter<ProductState> emit) async {
    emit(const ProductLoading());

    try {
      final querySnapshot =
      await FirebaseFirestore.instance.collection('products').get();

      final products = querySnapshot.docs
          .map((doc) => ProductModel.fromMap(doc.data()))
          .toList();

      if (products.isEmpty) {
        emit(const ProductEmpty());
      } else {
        emit(ProductLoaded(products));
      }
    } catch (exception) {
      emit(ProductError('Error fetching products: $exception'));
    }
  }
}

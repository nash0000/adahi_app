abstract class ProductsStates {}

class ProductsStateInitial extends ProductsStates {}

class ProductsStateLoading extends ProductsStates {}

class ProductsStateSuccess extends ProductsStates {}

class ProductsStateError extends ProductsStates {
  final error;

  ProductsStateError(this.error);
}

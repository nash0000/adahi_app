import 'package:adahi_app/screens/butcher/cubit/products_states.dart';

import 'package:adahi_app/screens/butcher/cubit/products_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit() : super(ProductsStateInitial());

  static ProductsCubit get(context) => BlocProvider.of(context);

  login() {
    emit(ProductsStateLoading());
  }
}

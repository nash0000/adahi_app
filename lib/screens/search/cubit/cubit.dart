import 'package:adahi_app/screens/search/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchStateInitial());

  static SearchCubit get(context) => BlocProvider.of(context);

  getSearch(String q) {
    emit(SearchStateLoading());
  }
}

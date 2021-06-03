import 'package:adahi_app/screens/login/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginStateInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  login() {
    emit(LoginStateLoading());
  }
}

import 'package:adahi_app/screens/login/cubit/states.dart';
import 'package:adahi_app/screens/register/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterStateInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  register() {
    emit(RegisterStateLoading());
  }
}

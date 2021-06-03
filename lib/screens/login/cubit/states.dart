abstract class LoginStates {}

class LoginStateInitial extends LoginStates {}

class LoginStateLoading extends LoginStates {}

class LoginStateSuccess extends LoginStates {}

class LoginStateError extends LoginStates {
  final error;

  LoginStateError(this.error);
}

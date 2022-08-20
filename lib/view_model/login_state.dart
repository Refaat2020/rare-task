abstract class LoginState  {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}
class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}
class LoginDone extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginError extends LoginState {
  final String errorMessage;

  LoginError(this.errorMessage);

  @override
  List<Object> get props => [];
}
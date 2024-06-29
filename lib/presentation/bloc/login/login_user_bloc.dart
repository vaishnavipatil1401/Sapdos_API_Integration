import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_api_integration_assignment/domain/usecases/login.dart';
import 'login_user_event.dart';
import 'login_user_state.dart';

class LoginUserBloc extends Bloc<LoginUserEvent, LoginUserState> {
  final LoginUseCase loginUseCase;

  LoginUserBloc({required this.loginUseCase}) : super(LoginUserInitial());

  @override
  Stream<LoginUserState> mapEventToState(LoginUserEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginUserLoading();
      try {
        final loginResponse = await loginUseCase(event.loginRequest);
        yield LoginUserSuccess(token: loginResponse.token);
      } catch (error) {
        yield LoginUserFailure(error: error.toString());
      }
    }
  }
}

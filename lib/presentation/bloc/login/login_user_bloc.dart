import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_api_integration_assignment/domain/usecases/login.dart';
import 'login_user_event.dart';
import 'login_user_state.dart';

class LoginUserBloc extends Bloc<LoginUserEvent, LoginUserState> {
  final LoginUseCase loginUseCase;

  LoginUserBloc({required this.loginUseCase}) : super(LoginUserInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginUserLoading());
      try {
        final loginResponse = await loginUseCase(event.loginRequest);
        if (loginResponse.token != null) {
          emit(LoginUserSuccess(token: loginResponse.token!));
        } else {
          emit(LoginUserFailure(error: 'Invalid response from server'));
        }
      } catch (error) {
        emit(LoginUserFailure(error: error.toString()));
      }
    });
  }
}

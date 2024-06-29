//register_user_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_api_integration_assignment/domain/usecases/register.dart';
import 'register_user_event.dart';
import 'register_user_state.dart';

class RegisterUserBloc extends Bloc<RegisterUserEvent, RegisterUserState> {
  final RegisterUseCase registerUseCase;

  RegisterUserBloc({required this.registerUseCase}) : super(RegisterUserInitial());

  @override
  Stream<RegisterUserState> mapEventToState(RegisterUserEvent event) async* {
    if (event is RegisterButtonPressed) {
      yield RegisterUserLoading();
      try {
        final registerResponse = await registerUseCase(event.registerRequest);
        yield RegisterUserSuccess(message: registerResponse.message);
      } catch (error) {
        yield RegisterUserFailure(error: error.toString());
      }
    }
  }
}

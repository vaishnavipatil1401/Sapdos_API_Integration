import 'package:get_it/get_it.dart';
import 'package:sapdos_api_integration_assignment/data/repositories/api_service.dart';
import 'package:sapdos_api_integration_assignment/data/repositories/user_repository_impl.dart';
import 'package:sapdos_api_integration_assignment/domain/repositories/user_repository.dart';
import 'package:sapdos_api_integration_assignment/domain/usecases/login.dart';
import 'package:sapdos_api_integration_assignment/domain/usecases/register.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(() => ApiService());
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(apiService: getIt<ApiService>()));
  getIt.registerLazySingleton(() => LoginUseCase(userRepository: getIt<UserRepository>()));
  getIt.registerLazySingleton(() => RegisterUseCase(userRepository: getIt<UserRepository>()));
}

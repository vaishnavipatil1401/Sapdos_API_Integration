import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_api_integration_assignment/data/repositories/api_service.dart';
import 'package:sapdos_api_integration_assignment/data/repositories/user_repository_impl.dart';
import 'package:sapdos_api_integration_assignment/domain/usecases/get_doctor_dashboard.dart';
import 'package:sapdos_api_integration_assignment/domain/usecases/login.dart';
import 'package:sapdos_api_integration_assignment/domain/usecases/register.dart';
import 'package:sapdos_api_integration_assignment/presentation/bloc/doctor_dashboard/doctor_dashboard_bloc.dart';
import 'package:sapdos_api_integration_assignment/presentation/bloc/login/login_user_bloc.dart';
import 'package:sapdos_api_integration_assignment/presentation/bloc/patient/patient_bloc.dart';
import 'package:sapdos_api_integration_assignment/presentation/bloc/register/register_user_bloc.dart';
import 'package:sapdos_api_integration_assignment/presentation/pages/doctor_dashboard_screen.dart';
import 'package:sapdos_api_integration_assignment/presentation/pages/patient_details_screen.dart';
import 'package:sapdos_api_integration_assignment/presentation/pages/patient_list_screen.dart';
import 'package:sapdos_api_integration_assignment/presentation/pages/sign_up_screen.dart';

// main.dart or application entry point
void main() {
  runApp(SapdosApiIntegrationApp());
}

class SapdosApiIntegrationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final apiService = ApiService();
    final getDoctorDashboardUseCase = GetDoctorDashboardUseCase(apiService: apiService);

    return MultiBlocProvider(
      providers: [
        BlocProvider<DoctorDashboardBloc>(
          create: (context) => DoctorDashboardBloc(getDoctorDashboardUseCase: getDoctorDashboardUseCase),
        ),
        // Add other BlocProviders as needed
      ],
      child: MaterialApp(
        title: 'Sapdos API Integration',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/doctor-dashboard', // Ensure correct initial route
        routes: {
          '/doctor-dashboard': (context) => DoctorDashboardScreen(),
          // Add other routes
        },
      ),
    );
  }
}

/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_api_integration_assignment/data/repositories/api_service.dart';
import 'package:sapdos_api_integration_assignment/data/repositories/user_repository_impl.dart';
import 'package:sapdos_api_integration_assignment/domain/usecases/get_doctor_dashboard.dart';
import 'package:sapdos_api_integration_assignment/domain/usecases/login.dart';
import 'package:sapdos_api_integration_assignment/domain/usecases/register.dart';
import 'package:sapdos_api_integration_assignment/presentation/bloc/doctor_dashboard/doctor_dashboard_bloc.dart';
import 'package:sapdos_api_integration_assignment/presentation/bloc/login/login_user_bloc.dart';
import 'package:sapdos_api_integration_assignment/presentation/bloc/patient/patient_bloc.dart';
import 'package:sapdos_api_integration_assignment/presentation/bloc/register/register_user_bloc.dart';
import 'package:sapdos_api_integration_assignment/presentation/pages/doctor_dashboard_screen.dart';
import 'package:sapdos_api_integration_assignment/presentation/pages/login_screen.dart';
import 'package:sapdos_api_integration_assignment/presentation/pages/patient_details_screen.dart';
import 'package:sapdos_api_integration_assignment/presentation/pages/patient_list_screen.dart';
import 'package:sapdos_api_integration_assignment/presentation/pages/sign_up_screen.dart';

void main() {
  runApp(SapdosApiIntegrationApp());
}

class SapdosApiIntegrationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final apiService = ApiService();
    final getDoctorDashboardUseCase = GetDoctorDashboardUseCase(apiService: apiService);
    final userRepository = UserRepositoryImpl(apiService: apiService);

    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginUserBloc>(
          create: (context) => LoginUserBloc(loginUseCase: LoginUseCase(userRepository: userRepository)),
        ),
        BlocProvider<RegisterUserBloc>(
          create: (context) => RegisterUserBloc(registerUseCase: RegisterUseCase(userRepository: userRepository)),
        ),
        BlocProvider<DoctorDashboardBloc>(
          create: (context) => DoctorDashboardBloc(getDoctorDashboardUseCase: getDoctorDashboardUseCase),
        ),
        BlocProvider<PatientBloc>(
          create: (context) => PatientBloc(apiService: apiService),
        ),
      ],
      child: MaterialApp(
        title: 'Sapdos API Integration',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //initialRoute: '/login',
        initialRoute: '/doctor-dashboard',
        routes: {
        //  '/login': (context) => LoginScreen(),
         // '/sign-up': (context) => SignUpScreen(),
          '/doctor-dashboard': (context) => DoctorDashboardScreen(),
          '/patient-details': (context) => PatientDetailsScreen(
            patientId: ModalRoute.of(context)!.settings.arguments as String,
          ),
          '/patient-list': (context) => PatientListScreen(),
        },
      ),
    );
  }
}*/

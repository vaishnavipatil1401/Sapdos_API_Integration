import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/screens/doctor_dashboard_screen.dart';
import 'presentation/screens/doctor_list_screen.dart';
import 'presentation/screens/book_appointment_screen.dart';
import 'data/repositories/api_service.dart';
import 'domain/usecases/get_doctor_dashboard.dart';
import 'domain/usecases/get_patient.dart';
import 'domain/usecases/get_doctor_list.dart';
import 'domain/usecases/get_doctor_details.dart';
import 'domain/usecases/get_available_slots.dart';
import 'domain/usecases/book_appointment.dart';
import 'presentation/bloc/doctor_dashboard/doctor_dashboard_bloc.dart';
import 'presentation/bloc/doctor_list/doctor_list_bloc.dart';
import 'presentation/bloc/doctor_details/doctor_details_bloc.dart';
import 'presentation/bloc/book_appointment/book_appointment_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DoctorDashboardBloc(getDoctorDashboardUseCase: GetDoctorDashboardUseCase(apiService: ApiService()))),
        BlocProvider(create: (context) => DoctorListBloc(getDoctorListUseCase: GetDoctorListUseCase(apiService: ApiService()))),
        BlocProvider(create: (context) => DoctorDetailsBloc(getDoctorDetailsUseCase: GetDoctorDetailsUseCase(apiService: ApiService()))),
        BlocProvider(create: (context) => BookAppointmentBloc(bookAppointmentUseCase: BookAppointmentUseCase(apiService: ApiService()))),
      ],
      child: MaterialApp(
        title: 'Doctor Appointment App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/doctor-dashboard',
        routes: {
          '/doctor-dashboard': (context) => DoctorDashboardScreen(),
          '/doctor-list': (context) => DoctorListScreen(),
          '/book-appointment': (context) => BookAppointmentScreen(),
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

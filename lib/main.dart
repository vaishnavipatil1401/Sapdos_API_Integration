
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection/service_locator.dart'; 
import 'data/repositories/api_service.dart';
import 'data/repositories/user_repository_impl.dart';
import 'domain/usecases/get_doctor_dashboard.dart';
import 'domain/usecases/login.dart';
import 'domain/usecases/register.dart';
import 'domain/usecases/get_doctor_list.dart';
import 'domain/usecases/get_doctor_details.dart';
import 'domain/usecases/get_available_slots.dart';
import 'domain/usecases/book_appointment.dart';
import 'presentation/bloc/doctor_dashboard/doctor_dashboard_bloc.dart';
import 'presentation/bloc/login/login_user_bloc.dart';
import 'presentation/bloc/register/register_user_bloc.dart';
import 'presentation/bloc/patient/patient_bloc.dart';
import 'presentation/bloc/doctor_list/doctor_list_bloc.dart';
import 'presentation/bloc/doctor_details/doctor_details_bloc.dart';
import 'presentation/bloc/book_appointment/book_appointment_bloc.dart';
import 'presentation/pages/login_screen.dart';
import 'presentation/pages/sign_up_screen.dart';
import 'presentation/pages/doctor_dashboard_screen.dart';
import 'presentation/pages/patient_details_screen.dart';
import 'presentation/pages/patient_list_screen.dart';
import 'presentation/pages/doctor_list_screen.dart';
import 'presentation/pages/book_appointment_screen.dart';

void main() {
  setupLocator();
  runApp(SapdosApiIntegrationApp());
}

class SapdosApiIntegrationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginUserBloc>(
          create: (context) => LoginUserBloc(loginUseCase: getIt<LoginUseCase>()),
        ),
        BlocProvider<RegisterUserBloc>(
          create: (context) => RegisterUserBloc(registerUseCase: getIt<RegisterUseCase>()),
        ),
        BlocProvider<DoctorDashboardBloc>(
          create: (context) => DoctorDashboardBloc(getDoctorDashboardUseCase: getIt<GetDoctorDashboardUseCase>()),
        ),
        BlocProvider<PatientBloc>(
          create: (context) => PatientBloc(apiService: getIt<ApiService>()),
        ),
        BlocProvider<DoctorListBloc>(
          create: (context) => DoctorListBloc(getDoctorListUseCase: getIt<GetDoctorListUseCase>()),
        ),
        BlocProvider<DoctorDetailsBloc>(
          create: (context) => DoctorDetailsBloc(getDoctorDetailsUseCase: getIt<GetDoctorDetailsUseCase>()),
        ),
        BlocProvider<BookAppointmentBloc>(
          create: (context) => BookAppointmentBloc(bookAppointmentUseCase: getIt<BookAppointmentUseCase>()),
        ),
      ],
      child: MaterialApp(
        title: 'Sapdos API Integration',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginScreen(),
          '/sign-up': (context) => SignUpScreen(),
          '/doctor-dashboard': (context) => DoctorDashboardScreen(),
          '/patient-details': (context) => PatientDetailsScreen(
            patientId: ModalRoute.of(context)!.settings.arguments as String,
          ),
          '/patient-list': (context) => PatientListScreen(),
          '/doctor-list': (context) => DoctorListScreen(),
          '/book-appointment': (context) => BookAppointmentScreen(bookAppointmentUseCase: getIt<BookAppointmentUseCase>()),
        },
      ),
    );
  }
}

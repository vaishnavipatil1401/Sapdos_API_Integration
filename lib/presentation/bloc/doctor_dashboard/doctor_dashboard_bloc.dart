import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_api_integration_assignment/domain/usecases/get_doctor_dashboard.dart';
import 'doctor_dashboard_event.dart';
import 'doctor_dashboard_state.dart';

class DoctorDashboardBloc extends Bloc<DoctorDashboardEvent, DoctorDashboardState> {
  final GetDoctorDashboardUseCase getDoctorDashboardUseCase;

  DoctorDashboardBloc({required this.getDoctorDashboardUseCase}) : super(DoctorDashboardInitial()) {
    on<FetchDoctorDashboard>(_onFetchDoctorDashboard);
  }

  void _onFetchDoctorDashboard(FetchDoctorDashboard event, Emitter<DoctorDashboardState> emit) async {
    emit(DoctorDashboardLoading());
    try {
      final doctorDashboard = await getDoctorDashboardUseCase.call();
      emit(DoctorDashboardLoaded(doctorDashboard: doctorDashboard));
    } catch (error) {
      emit(DoctorDashboardFailure(error: error.toString()));
    }
  }
}

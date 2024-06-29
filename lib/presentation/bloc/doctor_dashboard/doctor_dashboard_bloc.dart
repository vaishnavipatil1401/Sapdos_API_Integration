import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_api_integration_assignment/domain/usecases/get_doctor_dashboard.dart';
import 'doctor_dashboard_event.dart';
import 'doctor_dashboard_state.dart';

class DoctorDashboardBloc extends Bloc<DoctorDashboardEvent, DoctorDashboardState> {
  final GetDoctorDashboardUseCase getDoctorDashboardUseCase;

  DoctorDashboardBloc({required this.getDoctorDashboardUseCase}) : super(DoctorDashboardInitial());

  @override
  Stream<DoctorDashboardState> mapEventToState(DoctorDashboardEvent event) async* {
    if (event is FetchDoctorDashboard) {
      yield DoctorDashboardLoading();
      try {
        final doctorDashboard = await getDoctorDashboardUseCase();
        yield DoctorDashboardLoaded(doctorDashboard: doctorDashboard);
      } catch (error) {
        yield DoctorDashboardFailure(error: error.toString());
      }
    }
  }
}

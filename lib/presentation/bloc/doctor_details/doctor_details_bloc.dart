import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_api_integration_assignment/domain/usecases/get_doctor_details.dart';
import 'package:sapdos_api_integration_assignment/domain/entities/doctor.dart';
import 'doctor_details_event.dart';
import 'doctor_details_state.dart';

class DoctorDetailsBloc extends Bloc<DoctorDetailsEvent, DoctorDetailsState> {
  final GetDoctorDetailsUseCase getDoctorDetailsUseCase;

  DoctorDetailsBloc({required this.getDoctorDetailsUseCase}) : super(DoctorDetailsInitial()) {
    on<FetchDoctorDetails>(_onFetchDoctorDetails);
  }

  void _onFetchDoctorDetails(FetchDoctorDetails event, Emitter<DoctorDetailsState> emit) async {
    emit(DoctorDetailsLoading());
    try {
      final doctorModel = await getDoctorDetailsUseCase(event.doctorId);
      final doctor = doctorModel.toDomain();
      emit(DoctorDetailsLoaded(doctor: doctor));
    } catch (error) {
      emit(DoctorDetailsFailure(error: error.toString()));
    }
  }
}

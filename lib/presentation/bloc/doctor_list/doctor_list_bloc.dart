import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_api_integration_assignment/domain/usecases/get_doctor_list.dart';
import 'doctor_list_event.dart';
import 'doctor_list_state.dart';

class DoctorListBloc extends Bloc<DoctorListEvent, DoctorListState> {
  final GetDoctorListUseCase getDoctorListUseCase;

  DoctorListBloc({required this.getDoctorListUseCase}) : super(DoctorListInitial()) {
    on<FetchDoctorList>(_onFetchDoctorList);
  }

  void _onFetchDoctorList(FetchDoctorList event, Emitter<DoctorListState> emit) async {
    emit(DoctorListLoading());
    try {
      final doctors = await getDoctorListUseCase();
      emit(DoctorListLoaded(doctors: doctors));
    } catch (error) {
      emit(DoctorListFailure(error: error.toString()));
    }
  }
}

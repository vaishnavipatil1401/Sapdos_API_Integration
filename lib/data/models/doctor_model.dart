import 'package:sapdos_api_integration_assignment/domain/entities/doctor.dart';

class DoctorModel {
  final String id;
  final String name;
  final String specialization;
  final List<String> availableSlots;

  DoctorModel({
    required this.id,
    required this.name,
    required this.specialization,
    required this.availableSlots,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'],
      name: json['name'],
      specialization: json['specialization'],
      availableSlots: List<String>.from(json['availableSlots']),
    );
  }

  Doctor toDomain() {
    return Doctor(
      id: id,
      name: name,
      specialization: specialization,
      availableSlots: availableSlots,
    );
  }
}

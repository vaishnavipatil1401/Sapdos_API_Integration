// domain/entities/doctor.dart
class Doctor {
  final String id;
  final String name;
  final String specialization;
  final List<String> availableSlots;

  Doctor({
    required this.id,
    required this.name,
    required this.specialization,
    required this.availableSlots,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      name: json['name'],
      specialization: json['specialization'],
      availableSlots: List<String>.from(json['availableSlots']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'specialization': specialization,
      'availableSlots': availableSlots,
    };
  }
}

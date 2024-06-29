// patient_model.dart
class Patient {
  final String id;
  final String name;
  final String details;
  final bool isExpanded;

  Patient({required this.id, required this.name, required this.details, this.isExpanded = false});

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'],
      name: json['name'],
      details: json['details'],
      isExpanded: json['isExpanded'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'details': details,
      'isExpanded': isExpanded,
    };
  }

  Patient copyWith({bool? isExpanded}) {
    return Patient(
      id: this.id,
      name: this.name,
      details: this.details,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }
}

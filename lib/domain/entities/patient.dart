class Patient {
  final String id;
  final String name;
  final String details;

  Patient({required this.id, required this.name, required this.details});

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'],
      name: json['name'],
      details: json['details'],
    );
  }
}

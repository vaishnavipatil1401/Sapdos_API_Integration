class RegisterRequestModel {
  final String email;
  final String password;
  final String phoneNumber;

  RegisterRequestModel({
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
    };
  }
}

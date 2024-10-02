class Educatorentities {
  final String name;
  final String email;
  final bool isVerified;
  final bool isLoggedIn;
  final String password;
  final int otp;
  final int phoneNumber;

  Educatorentities({
    required this.isVerified,
    required this.isLoggedIn,
    required this.password,
    required this.otp,
    required this.phoneNumber,
    required this.name,
    required this.email,
  });
}

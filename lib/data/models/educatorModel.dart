class Educatormodel {
  String? name;
  String? email;
  bool? isVerified;
  bool? isLoggedIn;
  String? password;
  String? otp;
  String? phoneNumber;

  Educatormodel(
      {this.name,
      this.email,
      this.isVerified,
      this.isLoggedIn,
      this.password,
      this.otp,
      this.phoneNumber});

  Educatormodel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    isVerified = json['isVerified'];
    isLoggedIn = json['isLoggedIn'];
    password = json['password'];
    otp = json['otp'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['isVerified'] = isVerified;
    data['isLoggedIn'] = isLoggedIn;
    data['password'] = password;
    data['otp'] = otp;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}

class UserModel {
  String? name;
  String? phoneNumber;
  String? email;
  String? password;

  UserModel({this.name, this.phoneNumber, this.email, this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}

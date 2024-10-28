class StudentModel {
  String? id;
  String? name;
  int? rollNo;

  StudentModel({this.id, this.name, this.rollNo});

  StudentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    rollNo = json['roll_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['roll_no'] = rollNo;
    return data;
  }
}

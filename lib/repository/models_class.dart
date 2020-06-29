class Doctor {
  final String uid;
  final int fee;
  final String doctor_name;
  final String speciality;

  Doctor({this.uid, this.fee, this.doctor_name, this.speciality});

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
        uid: json['userId'],
        fee: json['fee'],
        doctor_name: json['doctor_name'],
        speciality: json['speciality']);
  }
}

class Speciality {
  final List<String> speciality;
  Speciality({this.speciality});
  factory Speciality.fromJson(Map<String, dynamic> json) {
    return Speciality(speciality: json['doctor_name'].cast<String>());
  }
}

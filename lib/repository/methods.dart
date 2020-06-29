import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'models_class.dart';
import 'package:random_string/random_string.dart';

final Firestore firestore = Firestore.instance;

Future<Speciality> getSpeciality() async {
  final response = await http.post('http://192.168.0.101:8080/setSpeciality');
  if (response.statusCode == 200) {
    return Speciality.fromJson(jsonDecode(response.body));
  } else {
    return throw Exception('Failed to load album');
  }
}

// Future<List> doctorlist(String speciality) async {
//   final response = await http.post('http://192.168.0.101:8080/querysnapshot', body: {'speciality': speciality});
//   print('got response successfully');
//   if (response.statusCode == 200) {
//     print(response.body);
//     return json.decode(response.body);
//   } else {
//     throw Exception('Failed to load album');
//   }
// }

Future doctorlist(String speciality) async {
  QuerySnapshot qn = await firestore
      .collection('doctors')
      .where('speciality', isEqualTo: speciality)
      .getDocuments();

  print(qn.documents);
  return qn.documents;
}

class Booking {
  final int patient_age;
  Booking({this.patient_age});
  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(patient_age: json['patient_age']);
  }
}

Future makebooking(String doctor_name, String doctor_uid, String speciality,
    String patient_name, String patient_id, int patient_age) async {
  var booking_id = randomAlpha(20);
  return await firestore.collection('booking').document(booking_id).setData({
    "patient_name": patient_name,
    "patient_id": patient_id,
    "booking_id": booking_id,
    "doctor_name": doctor_name,
    "doctor_uid": doctor_uid,
    "speciality": speciality,
    "patient_age": patient_age,
  });
}

Future onPressed() async {
//  var firebaseUser = await FirebaseAuth.instance.currentUser();
  firestore.collection("speciality").getDocuments().then((querySnapshot) {
    querySnapshot.documents.forEach((result) {
      print(result.data);
    });
  });
}

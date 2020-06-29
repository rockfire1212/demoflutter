import 'package:demoflutter/doctor_list.dart';
import 'package:demoflutter/repository/methods.dart';
import 'package:flutter/material.dart';
import 'repository/models_class.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  Future<Speciality> futureSpeciality;
  Future<Doctor> doctor;

  @override
  void initState() {
    super.initState();
    futureSpeciality = getSpeciality();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Speciality>(
        future: futureSpeciality,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final int length = snapshot.data.speciality.length;
            return Container(
              margin: EdgeInsets.only(top: 70),
              child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(length, (index) {
                    return Center(
                      child: Card(
                        margin: EdgeInsets.all(10),
                        child: InkWell(
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () async {
                            var speciality = await doctorlist(
                                snapshot.data.speciality[index]);

                            if (speciality != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DoctorList(
                                      speciality:
                                          snapshot.data.speciality[index]),
                                ),
                              );
                            } else {
                              print('error');
                            }
                          },
                          child: Container(
                            width: 300,
                            height: 200,
                            color: Colors.blue,
                            child: Center(
                                child: Text(
                              '${snapshot.data.speciality[index]}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                          ),
                        ),
                      ),
                    );
                  })),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

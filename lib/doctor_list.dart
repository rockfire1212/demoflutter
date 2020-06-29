import 'package:flutter/services.dart';
import 'package:demoflutter/alet_form.dart';
import 'package:demoflutter/repository/api_responce.dart';
import 'package:demoflutter/repository/methods.dart';
import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';

class DoctorList extends StatefulWidget {
  final String speciality;

  DoctorList({Key key, this.speciality}) : super(key: key);

  @override
  _DoctorListState createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  Future doctor;
  final _formKey = GlobalKey<FormState>();
  final patient_name = TextEditingController();
  final patient_age = TextEditingController();
  // const GlobalKey<ScaffoldState>() _scaffoldKey = GlobalKey<ScaffoldState>();
  final snackBar = SnackBar(content: Text('Your Booking has been done'));

// Find the Scaffold in the widget tree and use it to show a SnackBar.

  @override
  void initState() {
    super.initState();
    print(widget.speciality);
    doctor = doctorlist(widget.speciality);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Choose Doctor'),
        ),
        body: Container(
          child: FutureBuilder(
              future: doctor,
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, index) {
                      return Container(
                          width: 250,
                          child: Card(
                              elevation: 5,
                              child: Column(
                                  // mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(height: 20),
                                        ListTile(
                                          leading: Container(
                                            margin: EdgeInsets.only(left: 130),
                                            padding: EdgeInsets.all(30),
                                            width: 80,
                                            height: 80,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      'https://cdn4.vectorstock.com/i/1000x1000/34/53/default-placeholder-doctor-half-length-portrait-vector-20773453.jpg'),
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(
                                          snapshot
                                              .data[index].data["doctor_name"]
                                              .toUpperCase(),
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        SizedBox(height: 10),
                                        Text(snapshot
                                            .data[index].data["speciality"]),
                                      ],
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Text(
                                            'Fees : ₹' +
                                                snapshot
                                                    .data[index].data['fees']
                                                    .toString(),
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          ButtonBar(children: <Widget>[
                                            FlatButton(
                                                child: const Text('Book Now'),
                                                onPressed: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          content: Stack(
                                                            overflow: Overflow
                                                                .visible,
                                                            children: <Widget>[
                                                              Positioned(
                                                                right: -40.0,
                                                                top: -40.0,
                                                                child:
                                                                    InkResponse(
                                                                  onTap: () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  child:
                                                                      CircleAvatar(
                                                                    child: Icon(
                                                                        Icons
                                                                            .close),
                                                                    backgroundColor:
                                                                        Colors
                                                                            .red,
                                                                  ),
                                                                ),
                                                              ),
                                                              Form(
                                                                key: _formKey,
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: <
                                                                      Widget>[
                                                                    Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            patient_name,
                                                                        decoration: InputDecoration(
                                                                            prefixIcon: new Icon(Icons.person),
                                                                            enabledBorder: OutlineInputBorder(
                                                                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                                                              borderSide: BorderSide(color: Colors.grey, width: 1),
                                                                            ),
                                                                            focusedBorder: OutlineInputBorder(
                                                                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                                              borderSide: BorderSide(color: Colors.black),
                                                                            ),
                                                                            hintText: 'Patient Name'),
                                                                        validator:
                                                                            (value) {
                                                                          if (value
                                                                              .isEmpty) {
                                                                            return 'Patient Name is must';
                                                                          }
                                                                          return null;
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              8.0),
                                                                      child: TextFormField(
                                                                          controller: patient_age,
                                                                          keyboardType: TextInputType.number,
                                                                          inputFormatters: <TextInputFormatter>[
                                                                            LengthLimitingTextInputFormatter(12),
                                                                            WhitelistingTextInputFormatter.digitsOnly,
                                                                            BlacklistingTextInputFormatter.singleLineFormatter,
                                                                          ],
                                                                          decoration: InputDecoration(
                                                                            prefixIcon:
                                                                                Icon(Icons.accessibility_new),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                                                              borderSide: BorderSide(color: Colors.grey, width: 1),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                                              borderSide: BorderSide(color: Colors.grey),
                                                                            ),
                                                                            hintText:
                                                                                'Patient Age',
                                                                          ),
                                                                          validator: (value) {
                                                                            if (value.isEmpty) {
                                                                              return 'Patient Age Cannot be Blank';
                                                                            } else if (int.parse(value) <=
                                                                                0) {
                                                                              return 'Please Enter Appropriate Age';
                                                                            }
                                                                            return null;
                                                                          }),
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          RaisedButton(
                                                                        child: Text(
                                                                            "Confirm Booking"),
                                                                        onPressed:
                                                                            () async {
                                                                          if (_formKey
                                                                              .currentState
                                                                              .validate()) {
                                                                            _formKey.currentState.save();
                                                                            var name =
                                                                                patient_name.text;
                                                                            int age =
                                                                                int.parse(patient_age.text);

                                                                            patient_age.clear();
                                                                            patient_name.clear();
                                                                            var speciality =
                                                                                snapshot.data[index].data["speciality"];
                                                                            var doctor_name =
                                                                                snapshot.data[index].data["doctor_name"];
                                                                            var doctor_uid =
                                                                                snapshot.data[index].data["uid"];
                                                                            var patient_id =
                                                                                'FixAnvg6Q9dNhLNwudlCUmnixCw2';
                                                                            var result =
                                                                                await makebooking(
                                                                              doctor_name,
                                                                              doctor_uid,
                                                                              speciality,
                                                                              name,
                                                                              patient_id,
                                                                              age,
                                                                            );
                                                                            print(result);
                                                                            if (result ==
                                                                                null) {
                                                                              Navigator.of(context).pop();
                                                                              Flushbar(
                                                                                message: "Your Booking has been made",
                                                                                duration: Duration(seconds: 3),
                                                                              )..show(context);
                                                                            }
                                                                          }
                                                                        },
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      });

                                                  child:
                                                  Text("Open Popup");
                                                })
                                          ])
                                        ])
                                  ])));
                    },
                  );
                }
              }),
        ));
  }
}

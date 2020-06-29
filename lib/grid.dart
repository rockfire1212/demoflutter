import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demoflutter/repository/methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewDemo extends StatefulWidget {
  @override
  _GridViewDemoState createState() => _GridViewDemoState();
}

class _GridViewDemoState extends State<GridViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Demo code'),
        ),
        body: StreamBuilder(
          stream: Firestore.instance.collection("speciality").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Text("loading data .....");
            return
//              Column(
//              children: <Widget>[
//                Text(snapshot.data.documents[0]["doctor_name"][0])
//              ],
//            );

                Container(
              margin: EdgeInsets.only(top: 70),
              child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(
                      snapshot.data.documents[0]["doctor_name"].length,
                      (index) {
                    return Center(
                      child: Card(
                        margin: EdgeInsets.all(10),
                        child: InkWell(
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () {},
                          child: Container(
                            width: 300,
                            height: 200,
                            color: Colors.blue,
                            child: Center(
                                child: Text(
                              '${snapshot.data.documents[0]["doctor_name"][index]}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                          ),
                        ),
                      ),
                    );
                  })),
            );
          },
        ));
  }
}

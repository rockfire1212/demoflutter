import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertBoxExample extends StatefulWidget {
  @override
  _AlertBoxExampleState createState() => _AlertBoxExampleState();
}

class Age {
  int id;
  String name;

  Age(this.id, this.name);

  static List<Age> getages() {
    return <Age>[
      Age(1, '18'),
      Age(2, '20'),
      Age(3, '30'),
      Age(4, '40'),
      Age(5, '60'),
    ];
  }
}

class _AlertBoxExampleState extends State<AlertBoxExample> {
  List<Age> _ages = Age.getages();
  List<DropdownMenuItem<Age>> _dropdownMenuItems;
  Age _selectedAge;

  bool _isSelected;
  List<String> _gender;
  List<String> _choices;
  int _defaultChoiceIndex;
  int _defaultChoiceIndex1;

  void initState() {
    super.initState();
    _isSelected = false;
    _defaultChoiceIndex1 = 0;
    _defaultChoiceIndex = 0;
    _choices = ['SELF', 'WIFE', 'MOM', 'DAD'];
    _gender = ['Male', 'Female'];

    _dropdownMenuItems = buildDropdownMenuItems(_ages);
    _selectedAge = _dropdownMenuItems[0].value;
  }

  List<DropdownMenuItem<Age>> buildDropdownMenuItems(List Ages) {
    List<DropdownMenuItem<Age>> items = List();
    for (Age age in Ages) {
      items.add(
        DropdownMenuItem(
          value: age,
          child: Text(age.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Age selectedAge) {
    setState(() {
      _selectedAge = selectedAge;
    });
  }

//   alert box function
  Future<bool> addDialog(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Book Doctor", style: TextStyle(fontSize: 15.0)),
            content:
                // card design of alert box
                Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              height: 300,
              width: 700,
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.all(7),
                  child: Stack(children: <Widget>[
                    Align(
                      alignment: Alignment.centerRight,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(left: 10, top: 5),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "who is paitent",
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      )
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      ChoiceChip(
                                        label: Text(_choices[0]),
                                        selected: _defaultChoiceIndex == 0,
                                        selectedColor: Colors.green,
                                        onSelected: (bool selected) {
                                          setState(() {
                                            _defaultChoiceIndex =
                                                selected ? 0 : 0;
                                          });
                                        },
                                        backgroundColor: Colors.blue,
                                        labelStyle:
                                            TextStyle(color: Colors.white),
                                      ),
                                      ChoiceChip(
                                        label: Text(_choices[1]),
                                        selected: _defaultChoiceIndex == 1,
                                        selectedColor: Colors.green,
                                        onSelected: (bool selected) {
                                          setState(() {
                                            _defaultChoiceIndex =
                                                selected ? 1 : 0;
                                          });
                                        },
                                        backgroundColor: Colors.blue,
                                        labelStyle:
                                            TextStyle(color: Colors.white),
                                      ),
                                      ChoiceChip(
                                        label: Text(_choices[2]),
                                        selected: _defaultChoiceIndex == 2,
                                        selectedColor: Colors.green,
                                        onSelected: (bool selected) {
                                          setState(() {
                                            _defaultChoiceIndex =
                                                selected ? 2 : 0;
                                          });
                                        },
                                        backgroundColor: Colors.blue,
                                        labelStyle:
                                            TextStyle(color: Colors.white),
                                      ),
                                      ChoiceChip(
                                        label: Text(_choices[3]),
                                        selected: _defaultChoiceIndex == 3,
                                        selectedColor: Colors.green,
                                        onSelected: (bool selected) {
                                          setState(() {
                                            _defaultChoiceIndex =
                                                selected ? 3 : 0;
                                          });
                                        },
                                        backgroundColor: Colors.blue,
                                        labelStyle:
                                            TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            "paitent Age",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          DropdownButton(
                                            value: _selectedAge,
                                            items: _dropdownMenuItems,
                                            onChanged: onChangeDropdownItem,
                                          ),
                                          Text(
                                              'Selected: ${_selectedAge.name}'),
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            "Gender",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              ChoiceChip(
                                                label: Text(_gender[0]),
                                                selected:
                                                    _defaultChoiceIndex1 == 0,
                                                selectedColor: Colors.green,
                                                onSelected: (bool selected) {
                                                  setState(() {
                                                    _defaultChoiceIndex1 =
                                                        selected ? 0 : 0;
                                                  });
                                                },
                                                backgroundColor: Colors.blue,
                                                labelStyle: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              ChoiceChip(
                                                label: Text(_gender[1]),
                                                selected:
                                                    _defaultChoiceIndex1 == 1,
                                                selectedColor: Colors.green,
                                                onSelected: (bool selected) {
                                                  setState(() {
                                                    _defaultChoiceIndex1 =
                                                        selected ? 1 : 0;
                                                  });
                                                },
                                                backgroundColor: Colors.blue,
                                                labelStyle: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ))
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Book"),
                textColor: Colors.blue,
                onPressed: () {
//
                  dailogTrigger(context);
                },
              )
            ],
          );
        });
  }

// fuction for radio button
  Widget choiceChips() {
    return Expanded(
      child: ListView.builder(
        itemCount: _choices.length,
        itemBuilder: (BuildContext context, int index) {
          return ChoiceChip(
            label: Text(_choices[index]),
            selected: _defaultChoiceIndex == index,
            selectedColor: Colors.green,
            onSelected: (bool selected) {
              setState(() {
                _defaultChoiceIndex = selected ? index : 0;
              });
            },
            backgroundColor: Colors.blue,
            labelStyle: TextStyle(color: Colors.white),
          );
        },
      ),
    );
  }

//fuction for second alert box
  Future<bool> dailogTrigger(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Doctor booked", style: TextStyle(fontSize: 15.0)),
            content: Text("Added"),
            actions: <Widget>[
              FlatButton(
                  child: Text("Allright"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Demo code'),
      ),
      body: Container(
        child: RaisedButton(
          color: Colors.red,
          child: Text("Add patient"),
          elevation: 6.0,
          onPressed: () {
//            code for alert box
            addDialog(context);
          },
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add-take-it-off.page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  _navigateToAddNewTakeIdOff() {
    Navigator.of(context).push(CupertinoPageRoute<void>(
      title: "Click me",
      builder: (BuildContext context) => AddTakeItOff(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: RaisedButton(
        onPressed: () {
          _navigateToAddNewTakeIdOff();
        },
        child: Text("Add"),
      )),
    );
  }
}

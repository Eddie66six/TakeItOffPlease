import 'dart:convert';

import 'package:flutter/material.dart';

import 'models/take-it-off-item.model.dart';
import 'models/take-it-off.model.dart';
import 'models/user.dart';

class AddTakeItOff extends StatefulWidget {
  @override
  _AddTakeItOffState createState() => _AddTakeItOffState();
}

class _AddTakeItOffState extends State<AddTakeItOff> {

  TextEditingController inputController;

  User user;
  @override
  void initState() {
    super.initState();
    inputController = TextEditingController();
    user = User(1, "Guilherme");
  }

  @override
  void dispose() {
    super.dispose();
    inputController.dispose();
  }

  addNewTakeItOff(String name){
    user.addNewTakeItOff(name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: inputController,
                  )
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      addNewTakeItOff(inputController.text);
                      inputController.clear();
                    });
                  },
                  child: Icon(Icons.add),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: user.listTakeItOff?.length ?? 0,
                itemBuilder: (BuildContext ctxt, int index) {
                    return new Text(user.listTakeItOff[index].name);
                }
              )
            )
          ],
        )
      ),
    );
  }
}
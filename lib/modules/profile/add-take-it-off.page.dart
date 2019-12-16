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
    //var takeItOff = TakeItOff("Pizza", "seila");
    user.addNewTakeItOff(TakeItOff("Pizza", "seila"));
    // takeItOff.addItem(TakeItOffItem("Cebola", ""));
    // takeItOff.addItem(TakeItOffItem("Ovo", ""));
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
                TextField(
                  controller: inputController,
                ),
                InkWell(
                  onTap: (){},
                  child: Icon(Icons.add),
                )
              ],
            ),
            ListView.builder(
              itemBuilder: (BuildContext ctxt, int index) {
                  return new Text(user.listTakeItOff[index].name);
              }
            )
          ],
        )
      ),
    );
  }
}
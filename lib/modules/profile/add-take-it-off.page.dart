import 'package:flutter/material.dart';
import 'package:flutter_take_it_off_please/components/normal-card.component.dart';
import 'package:flutter_take_it_off_please/modules/profile/models/take-it-off.model.dart';
import '../add-item-take-it-off.page.dart';
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

  removeTakeItOff(String name){
    user.removeTakeItOff(name);
  }

  addNewItemTakeItOff(TakeItOff takeItOff){
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AddItemTakeItOffPage(takeItOff)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(hintText: "Insira o nome da sua nova lista"),
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
              user.countItens == 0 ? Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/3),
                child: Text("Voce ainda nao adicionou nenhum item")
              ) :
              Expanded(
                child: ListView.builder(
                  itemCount: user.countItens,
                  itemBuilder: (BuildContext ctxt, int index) {
                      return NormalCardComponent(
                        user.listTakeItOff[index].name,
                        subText: " - Qtde: " + user.listTakeItOff[index].countItens.toString(),
                        clickOne: (){
                          setState(() {
                            addNewItemTakeItOff(user.listTakeItOff[index]);
                          });
                        },
                        iconClickOne: Icon(Icons.add),
                        clickTwo: (){
                          setState(() {
                            removeTakeItOff(user.listTakeItOff[index].name);
                          });
                        },
                        iconClickTwo: Icon(Icons.remove),
                      );
                  }
                )
              )
            ],
        ),
      )
    );
  }
}
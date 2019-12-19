import 'package:flutter/material.dart';
import 'package:flutter_take_it_off_please/components/normal-card.component.dart';

import 'profile/models/take-it-off.model.dart';

class AddItemTakeItOffPage extends StatefulWidget {
  TakeItOff takeItOff;
  AddItemTakeItOffPage(this.takeItOff);
  @override
  _AddItemTakeItOffPageState createState() => _AddItemTakeItOffPageState();
}

class _AddItemTakeItOffPageState extends State<AddItemTakeItOffPage> {
  TextEditingController inputController;

  @override
  void initState() {
    super.initState();
    inputController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    inputController.dispose();
  }

  addNewItemTakeItOff(String name){
    widget.takeItOff.addItem(name);
  }

  removeItemTakeItOff(String name){
    widget.takeItOff.removeItem(name);
  }

  backAndSave(){
    Navigator.of(context).pop(widget.takeItOff);
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
                    decoration: InputDecoration(hintText: "Insira o nome de um item"),
                    controller: inputController,
                  )
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      addNewItemTakeItOff(inputController.text);
                      inputController.clear();
                    });
                  },
                  child: Icon(Icons.add),
                )
              ],
            ),
            widget.takeItOff.countItens == 0 ? Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/3),
              child: Text("Voce ainda nao adicionou nenhum item")
            ) :
            Expanded(
              child: ListView.builder(
                itemCount: widget.takeItOff.countItens,
                itemBuilder: (BuildContext ctxt, int index) {
                    return NormalCardComponent(
                      widget.takeItOff.itens[index].name,
                      clickOne: (){
                          setState(() {
                            removeItemTakeItOff(widget.takeItOff.itens[index].name);
                          });
                        },
                        iconClickOne: Icon(Icons.remove),
                    );
                }
              )
            )
          ],
        )
      ),
    );
  }
}
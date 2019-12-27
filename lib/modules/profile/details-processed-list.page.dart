import 'package:flutter/material.dart';

import 'models/processed-list-item.model.dart';
import 'models/processed-list-sub-item.model.dart';
import 'models/processed-list.model.dart';
import 'models/user.model.dart';

class DetailsProcessedList extends StatefulWidget {
  User user;
  DetailsProcessedList(this.user);
  @override
  _DetailsProcessedListState createState() => _DetailsProcessedListState();
}

class _DetailsProcessedListState extends State<DetailsProcessedList> {
  ProcessedList processedList;
  @override
  void initState() {
    super.initState();
    processedList = ProcessedList(1, "Titulo", DateTime.now());
    processedList.itens = List<ProcessedListSubItem>();
    var list = List<ProcessedListItem>();
    list.add(ProcessedListItem(0, "Cebola", 2));
    list.add(ProcessedListItem(0, "Cebola", 2));
    list.add(ProcessedListItem(0, "Cebola", 2));
    list.add(ProcessedListItem(0, "Cebola", 2));
    list.add(ProcessedListItem(0, "Cebola", 2));
    list.add(ProcessedListItem(0, "Cebola", 2));
    list.add(ProcessedListItem(0, "Cebola", 2));
    list.add(ProcessedListItem(0, "Cebola", 2));
    list.add(ProcessedListItem(0, "Cebola", 2));
    list.add(ProcessedListItem(0, "Cebola", 2));
    list.add(ProcessedListItem(0, "Cebola", 2));
    list.add(ProcessedListItem(0, "Cebola", 2));
    list.add(ProcessedListItem(0, "Cebola", 2));
    processedList.itens.add(ProcessedListSubItem(0, "Pizza",list));
    processedList.itens.add(ProcessedListSubItem(0, "Lanche", list));
    list.add(ProcessedListItem(0, "Alho", 1));
    processedList.itens.add(ProcessedListSubItem(0, "Mexicano", list));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: processedList == null ? Center(child: Text("Erro")) : 
        Column(
          children: <Widget>[
            Center(child:
              Container(
                child: Text(processedList.name)
              )
            ),
            Expanded(
              child: ListView.builder(
                itemCount: processedList.countItens,
                itemBuilder: (buildContext, index){
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(processedList.itens[index].name, style: TextStyle(fontSize: 18))),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: 0,
                            maxHeight: MediaQuery.of(context).size.height/3
                          ),
                          child: Container(
                            child: SingleChildScrollView(
                              child: Column(
                                children: List.generate(processedList.itens[index].countItens, (i){
                                  return Container(
                                    decoration: BoxDecoration(color: Colors.grey[200]),
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Flexible(
                                            child: Text(processedList.itens[index].itens[i].name, overflow: TextOverflow.ellipsis)
                                          ),
                                          Text("Qtde " + processedList.itens[index].itens[i].amount.toString())
                                        ],
                                    ),
                                  );
                                })
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
    );
  }
}
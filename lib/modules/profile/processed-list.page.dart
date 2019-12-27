import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'details-processed-list.page.dart';
import 'models/user.model.dart';

class ProcessedListPage extends StatefulWidget {
  User user;
  ProcessedListPage(this.user);
  @override
  _ProcessedListPageState createState() => _ProcessedListPageState();
}

class _ProcessedListPageState extends State<ProcessedListPage> {

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.user.countFriends; i++) {
      widget.user.listFriends[i].isCheked = false;
    }
  }

  _createNewProcessedList() {
    Navigator.of(context).push(CupertinoPageRoute<void>(
      title: "",
      builder: (BuildContext context) => DetailsProcessedList(widget.user),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          InkWell(
            child: Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Text("Salvar")
              )
            ),
            onTap: (){_createNewProcessedList();},
          )
        ],
      ),
      body: Container(
        child: widget.user.countFriends == 0 ?
          Center(child: Container(child: Text("Nenhum amigo adicionado"))) :
        ListView.builder(
          itemCount: widget.user.countFriends,
          itemBuilder: (buildContext, index) {
            return Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              child: InkWell(
                onTap: (){
                  setState(() {
                        widget.user.listFriends[index].isCheked = !widget.user.listFriends[index].isCheked;
                  });
                },
                child: Row(
                  children: <Widget>[
                    Checkbox(value: widget.user.listFriends[index].isCheked ?? false, onChanged: (value){
                      setState(() {
                        widget.user.listFriends[index].isCheked = value;
                      });
                    }),
                    Flexible(child: Text(widget.user.listFriends[index].name, style: TextStyle(fontSize: 21), overflow: TextOverflow.ellipsis))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_take_it_off_please/components/normal-card.component.dart';
import 'package:flutter_take_it_off_please/modules/profile/models/friend.model.dart';

import 'models/user.model.dart';

class FriendsPage extends StatefulWidget {
  User user;
  FriendsPage(this.user);
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
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

  _addNewFriends(String code){
    widget.user.addNewFriend(Friend(1, "nome " + code, "ds", code));
  }

  _removeFriends(Friend friend){
    widget.user.removeFriend(friend);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Meu codigo: "),
                Text(widget.user.code)
              ],
            ),
            Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(hintText: "Insira o codigo do seu amigo"),
                      controller: inputController,
                    )
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        _addNewFriends(inputController.text);
                        inputController.clear();
                      });
                    },
                    child: Icon(Icons.add),
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.user.countFriends,
                  itemBuilder: (BuildContext ctxt, int index) {
                      return NormalCardComponent(
                        widget.user.listFriends[index].name,
                        subText: widget.user.listFriends[index].description,
                        clickOne: (){
                          setState(() {
                            _removeFriends(widget.user.listFriends[index]);
                          });
                        },
                        iconClickOne: Icon(Icons.remove),
                      );
                  }
                )
              )
          ],
        ),
      ),
    );
  }
}
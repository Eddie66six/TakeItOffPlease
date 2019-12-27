import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_take_it_off_please/modules/authentication/login.page.dart';
import 'package:flutter_take_it_off_please/modules/profile/friends.page.dart';
import 'package:flutter_take_it_off_please/modules/profile/processed-list.page.dart';

import 'add-take-it-off.page.dart';
import 'models/user.model.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User user;
  @override
  void initState() {
    super.initState();
    user = User(1, "Guilherme rodrigues", "seila seila 123 seila aaa", "1a2c3e");
  }

  _navigateToAddNewTakeIdOff() {
    Navigator.of(context).push(CupertinoPageRoute<void>(
      title: "",
      builder: (BuildContext context) => AddTakeItOff(user),
    ));
  }

  _navigateToFriends() {
    Navigator.of(context).push(CupertinoPageRoute<void>(
      title: "",
      builder: (BuildContext context) => FriendsPage(user),
    ));
  }

  _navigateToProcessedList() {
    Navigator.of(context).push(CupertinoPageRoute<void>(
      title: "",
      builder: (BuildContext context) => ProcessedListPage(user),
    ));
  }

  _logout(){
    Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute<void>(
            title: "Click me",
            builder: (BuildContext context) => LoginPage()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 150,
                width: 150,
                child: CircleAvatar(
                  backgroundImage: NetworkImage("https://i.pinimg.com/736x/64/1a/f4/641af4e9c02a2468a88e0bb49b28d5b7.jpg")
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5, top: 20),
                  child: Text(user.name, textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26), overflow: TextOverflow.ellipsis),
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: Text(user.description,
                    textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.grey), overflow: TextOverflow.fade),
              ),
              Container(
                child: RaisedButton(
                  onPressed: (){_navigateToAddNewTakeIdOff();},
                  child: Text("Minha lista"),
                ),
              ),
              Container(
                child: RaisedButton(
                  onPressed: (){_navigateToFriends();},
                  child: Text("Amigos"),
                ),
              ),
              Container(
                child: RaisedButton(
                  onPressed: (){_navigateToProcessedList();},
                  child: Text("Criar nova lista de convidados"),
                ),
              ),
              Container(
                child: RaisedButton(
                  onPressed: (){},
                  child: Text("Historico de lista de convidados"),
                ),
              ),
              Container(
                child: RaisedButton(
                  onPressed: (){_logout();},
                  child: Text("Sair"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

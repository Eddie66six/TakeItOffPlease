import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_take_it_off_please/modules/profile/profile.page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var scrollController;
  var openedKeyboard = false;
  var scrollable = false;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  _navigateToProfile() {
    Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute<void>(
            title: "Click me",
            builder: (BuildContext context) => ProfilePage()),
        (Route<dynamic> route) => false);
  }

  _buildForm() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          //logo
          TextField(
            decoration: InputDecoration(hintText: "Email"),
          ),
          TextField(
            decoration: InputDecoration(hintText: "Senha"),
          ),
          RaisedButton(
            onPressed: () {
              _navigateToProfile();
            },
            child: Text("Entrar"),
          )
        ],
      ),
    );
  }

  _animateToUpScroll() {
    scrollController.animateTo(1.0,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
    scrollable = true;
  }

  _animateToDownScroll() {
    scrollController.animateTo(0.0,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
    scrollable = false;
  }

  _checkScroll(){
    openedKeyboard = MediaQuery.of(context).viewInsets.bottom > 0;
    if (openedKeyboard) {
      _animateToUpScroll();
    } else if (scrollable) {
      _animateToDownScroll();
    }
  }

  @override
  Widget build(BuildContext context) {
    _checkScroll();
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          controller: scrollController,
          physics: scrollable
              ? AlwaysScrollableScrollPhysics()
              : NeverScrollableScrollPhysics(),
          child: _buildForm(),
        ),
      ),
    );
  }
}

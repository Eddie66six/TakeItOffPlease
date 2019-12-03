import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var scrollController = ScrollController();
  var openedKeyboard = false;
  var scrollable = false;

  @override
  void initState() {
    super.initState();
    // widget.focusNode.addListener(_ensureVisible);
    // WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    scrollController.dispose();
    // WidgetsBinding.instance.removeObserver(this);
    // widget.focusNode.removeListener(_ensureVisible);
    super.dispose();
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
            onPressed: (){},
            child: Text("Entrar"),
          )
        ],
      ),
    );
  }

  _animateToUpScroll(){
     scrollController.animateTo(1, duration: Duration(milliseconds: 500), curve: Curves.ease);
    scrollable = true;
  }

  _animateToDownScroll(){
    scrollController.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.ease);
    scrollable = false;
  }

  @override
  Widget build(BuildContext context) {
    openedKeyboard = MediaQuery.of(context).viewInsets.bottom > 0;
    if(openedKeyboard){
      _animateToUpScroll();
    }
    else if(scrollable){
      _animateToDownScroll();
    }
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          controller: scrollController,
          physics: scrollable ? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics(),
          child: _buildForm(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NormalCardComponent extends StatefulWidget {
  final String text;
  final String subText;
  final Function clickOne;
  final Icon iconClickOne;
  final Function clickTwo;
  final Icon iconClickTwo;
  NormalCardComponent(this.text, {this.subText, this.clickOne, this.iconClickOne, this.clickTwo, this.iconClickTwo});
  @override
  _NormalCardComponentState createState() => _NormalCardComponentState();
}

class _NormalCardComponentState extends State<NormalCardComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.green[200], width: 0.5))
      ),
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 0, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(child: Text(widget.text, style: TextStyle(fontSize: 24), overflow: TextOverflow.ellipsis)),
                    widget.subText == null ? Container() :
                      Flexible(child: Text(widget.subText, style: TextStyle(color: Colors.grey), overflow: TextOverflow.ellipsis)),
                  ],
              ),
            ),
          Row(
            children: <Widget>[
              widget.clickOne == null ? Container() :
                InkWell(
                  child: widget.iconClickOne,
                  onTap: (){widget.clickOne();},
                ),
              widget.clickTwo == null ? Container() :
                InkWell(
                  child: widget.iconClickTwo,
                  onTap: (){widget.clickTwo();},
                )
            ],
          )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'main.dart';
import 'eventCard.dart';
import 'dart:async';




 
class PageEntryWidget extends StatefulWidget {
  final Event entry;
 
  const PageEntryWidget({Key key, this.entry}) : super(key: key);

  @override
  _PageEntryWidgetState createState() => _PageEntryWidgetState();
}

class _PageEntryWidgetState extends State<PageEntryWidget> {
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollToEnd(milliseconds: 1000);
  }

  @override
  Widget build(BuildContext context) => OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
        scrollToEnd(milliseconds: 100);

        return 
        // Hero(
        //   tag : "hi",
        //   child:
          Stack(
          children: <Widget>[
            
           Padding(
          padding: const EdgeInsets.all(8.0),
          child: 
          ListView(
            controller: controller,
            children: <Widget>[
          new Image(
            image: new AssetImage(widget.entry.image),
            fit: BoxFit.cover,
            height: 300.0,
            width: double.infinity,
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 16.0)),
          Text(widget.entry.title,
              style: TextStyle(
                  letterSpacing: 3,
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(58, 66, 86, 1.0))),
          Padding(padding: EdgeInsets.symmetric(vertical: 6.0)),
          Container(
              decoration: new BoxDecoration(
                  border: new Border.all(color: Colors.grey[500]))),
          Padding(padding: EdgeInsets.symmetric(vertical: 22.0)),
          Text("Event Description",
              style: TextStyle(
                letterSpacing: 1,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(58, 66, 86, 1.0))),
          Padding(padding: EdgeInsets.symmetric(vertical: 6.0)),
          Text(widget.entry.description,
              style: TextStyle(
                  fontSize: 18.0, color: Color.fromRGBO(58, 66, 86, 1.0))),
          Padding(padding: EdgeInsets.symmetric(vertical: 16.0)),
          Text("Venue",
              style: TextStyle(
                letterSpacing: 1,
                  // fontFamily: "Roboto",
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(58, 66, 86, 1.0))),
          Padding(padding: EdgeInsets.symmetric(vertical: 6.0)),
          Text(widget.entry.venue,
              style: TextStyle(
                  fontSize: 18.0, color: Color.fromRGBO(58, 66, 86, 1.0))),
          Padding(padding: EdgeInsets.symmetric(vertical: 16.0)),
          Text("Time",
              style: TextStyle(
                letterSpacing: 1,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(58, 66, 86, 1.0))),
          Padding(padding: EdgeInsets.symmetric(vertical: 6.0)),
          Text(widget.entry.time,
              style: TextStyle(
                  fontSize: 18.0, color: Color.fromRGBO(58, 66, 86, 1.0))),
            ],
          ))],
        );
      });

  void scrollToEnd({int milliseconds}) {
    Timer(
      Duration(milliseconds: milliseconds),
      () {
        if (!controller.hasClients) return;
        controller.jumpTo(controller.position.maxScrollExtent);
      },
    );
  }
}
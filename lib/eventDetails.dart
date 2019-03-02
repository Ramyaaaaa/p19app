import 'package:flutter/material.dart';
import 'eventCard.dart';
import 'package:url_launcher/url_launcher.dart';
import 'main.dart';
import 'pageEntry.dart';
import 'flip_box.dart';
import 'flip_box_bar.dart';

class EventDetails extends MaterialPageRoute {
  EventDetails(Event event)
      : super(
            builder: (context) => new Details(
                  event: event,
              )
            );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }
}

class Details extends StatelessWidget {
  Details({this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    final Content = Container(
      height: MediaQuery.of(context).size.height,

      width: MediaQuery.of(context).size.width,

      // color: Theme.of(context).primaryColor,
      // padding: EdgeInsets.all(10.0),

      child:
          SingleChildScrollView(
          child:
          Column(
        children: <Widget>[

          new Image(
                    image: new AssetImage(event.image),
                    fit: BoxFit.cover,
                    height: 300.0,
                    width: double.infinity,
                  ),
          Padding(padding: EdgeInsets.symmetric(vertical: 16.0)),
          Text(event.title,
              style: TextStyle(
                  letterSpacing: 3,
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(58, 66, 86, 1.0))),
          Padding(padding: EdgeInsets.symmetric(vertical: 6.0)),
          Container(
              decoration: new BoxDecoration(
                  border: new Border.all(color: Colors.grey[500]))),
          Padding(padding: EdgeInsets.symmetric(vertical: 12.0)),
          Text("Event Description",
          
              style: TextStyle(
                letterSpacing: 1,
                  
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(58, 66, 86, 1.0))),
          Padding(padding: EdgeInsets.symmetric(vertical: 6.0)),
          Text(event.description,
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
          Text(event.venue,
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
          Text(event.time,
              style: TextStyle(
                  fontSize: 18.0, color: Color.fromRGBO(58, 66, 86, 1.0))),
         Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
         
        ],
      )),
    );





  final ValueNotifier currentPageNotifier = ValueNotifier<int>(0);

    return new Scaffold(
      appBar: AppBar(
        title: Text("Prayatna '19", style: TextStyle(color: Colors.black))),

      body: Hero(
        tag: "hi",
        child : Stack(
          children: <Widget>[
            PageView.builder(
              onPageChanged: (int index) {
                currentPageNotifier.value = index;
              },
              controller: PageController(
                initialPage: currentPageNotifier.value,
              ),
              itemBuilder: (BuildContext buildContext, int index) =>
                  PageEntryWidget(entry: events[index]),
              itemCount: events.length,
            ),
          
          ],
        )),

        bottomNavigationBar: FlipBoxBar(
        items: [
          FlipBarItem(
              icon: new Icon(IconData(0xe0b0, fontFamily: 'MaterialIcons')),
              text: Text("Contact"),
              frontColor: Colors.blue,
              backColor: Colors.blueAccent),
          FlipBarItem(
              icon: Icon(new IconData(59702, fontFamily: 'MaterialIcons')),
              text: Text("View Results"),
              frontColor: Colors.cyan,
              backColor: Colors.cyanAccent),
         
        ],
        onIndexChanged: (index) async{
          if (index == 0) {
            print("hi");
            String contact = event.contact;
            if (await canLaunch("tel:7358527747")) {
              await launch(contact);
            }
            } else if(index == 1){
              //results page
              print("bye");
            }

        }

          //print(newIndex);
       // },
      ),
    );
      
  }
}



      // body: Hero(
      //   tag: event.title,
        // child: NestedScrollView(
        //   headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        //     return <Widget>[
              
        //       // SliverAppBar(
        //       //   expandedHeight: 200.0,
        //       //   floating: false,
        //       //   pinned: true,
        //       //   flexibleSpace: FlexibleSpaceBar(
        //       //     centerTitle: true,
        //       //     title: Text(event.title,
        //       //         style: TextStyle(
        //       //           color: Colors.black,
        //       //           fontSize: 16.0,
        //       //         )),
        //           // background: new Image(
        //           //   image: new AssetImage(event.image),
        //           //   fit: BoxFit.cover,
        //           //   height: 300.0,
        //           //   width: double.infinity,
        //           // ),
        //         // ),
        //       // ),
        //     ];
        //   },
        //   body: 
        //     Content,
        //   ),
        
    //  ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: FloatingActionButton(
//       onPressed: () { },
//       tooltip: 'View Results',
//       child: Icon(new IconData(59702, fontFamily: 'MaterialIcons')),
//       elevation: 2.0,
//   ),
//   bottomNavigationBar: BottomAppBar(
    

// child: Row(
//       mainAxisSize: MainAxisSize.max,
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: <Widget>[

        
//       ],
//     ),
//     shape: CircularNotchedRectangle(),
//     color: Colors.blueGrey,
//   ),
  

      // bottomNavigationBar: BottomNavigationBar(
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(icon: BackButton(), title: Text('Back')),
          
      //     BottomNavigationBarItem(
      //         icon: new Icon(IconData(0xe0b0, fontFamily: 'MaterialIcons')),
      //         title: Text('Contact')),
      //     BottomNavigationBarItem(
      //         icon: Icon(new IconData(59702, fontFamily: 'MaterialIcons')),
      //         title: Text('View Results')),
      //   ],
      //   fixedColor: Colors.deepPurple,
      //   onTap: _bottomBar,
      // ),
    // );

    
  // }

  // void _bottomBar(index) async {
  //   print("Index " + index);
  //   if (index == 0) {
  //     String contact = event.contact;
  //     if (await canLaunch( contact)) {
  //       await launch(contact);
  //     } else if(index == 1){
  //       //results page
  //     }
  //   }
  // }
// }

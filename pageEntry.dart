import 'package:flutter/material.dart';
import 'main.dart';
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

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            controller: controller,
            children: <Widget>[
              Image.asset(widget.entry.image, fit: BoxFit.cover),
              SizedBox(height: 8.0),
              Text(widget.entry.title,
                  style: Theme.of(context).textTheme.title),
              SizedBox(height: 8.0),
              Text(widget.entry.description,
                  style: Theme.of(context).textTheme.body1),
            ],
          ),
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
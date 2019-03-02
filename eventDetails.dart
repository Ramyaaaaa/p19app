import 'package:flutter/material.dart';
import 'eventCard.dart';

class EventDetails extends StatefulWidget {
  Event event;
  final String title, tagline, time, venue, description, contact, image;
  EventsDetails({
    this.title,
    this.tagline,
    this.time,
    this.venue,
    this.description,
    this.contact,
    this.image,
  });
}

class EventDetails extends StatelessWidget {
  final Event event;
  final ShapeBorder shape;
  EventDetails({Key key, @required this.event, this.shape})
      : assert(event != null),
        super(key: key);
        
  @override
  Widget build(BuildContext context) {
  }
}
import 'package:flutter/material.dart';
import 'team.dart';

class ResultsPageRoute extends MaterialPageRoute {
  ResultsPageRoute({String title})
      : super(
          builder: (context) => new ResultsPage(title: title),
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }
}

class ResultsPage extends StatelessWidget {
  final String title;

  final teamDetails = <Team>[
    Team(
      members: ['ram', 'sam', 'ram'],
      marks: 70,
      rank: 1,
      isSelected: "Selected",
    ),
    Team(
      members: ['ram', 'sam', 'ram'],
      marks: 60,
      rank: 2,
      isSelected: "Selected",
    ),
    Team(
      members: ['ram', 'sam', 'ram'],
      marks: 40,
      rank: 3,
      isSelected: "",
    ),
    Team(
      members: ['ram', 'sam', 'ram'],
      marks: 20,
      rank: 4,
      isSelected: "",
    ),
  ];

  ResultsPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final TextStyle headStyle = theme.textTheme.subhead
        .copyWith(color: Colors.black87, fontWeight: FontWeight.bold);
    return Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: new ListView.builder(
            itemCount: teamDetails.length,
            itemBuilder: (BuildContext context, int index) {
              return new ResultsContent(
                teamDetails: this.teamDetails[index],
              );
            }));
  }
}

class ResultsContent extends StatelessWidget {
  final Team teamDetails;

  ResultsContent({
    Key key,
    @required this.teamDetails,
  })  : assert(teamDetails != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final TextStyle subheadStyle =
        theme.textTheme.subhead.copyWith(color: Colors.black87);

    return Column(children: <Widget>[
      Row(children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
            child: SizedBox(
              width: 150.0,
              child: Text("${teamDetails.rank}", style: subheadStyle),
            )),
        Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            textBaseline: TextBaseline.alphabetic,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10.0),
                  child: SizedBox(
                    width: 150.0,
                    child:
                        Text("${teamDetails.members[0]}", style: subheadStyle),
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10.0),
                  child: SizedBox(
                    width: 150.0,
                    child:
                        Text("${teamDetails.members[1]}", style: subheadStyle),
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10.0),
                  child: SizedBox(
                    width: 150.0,
                    child:
                        Text("${teamDetails.members[2]}", style: subheadStyle),
                  )),
            ]),
        Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text("${teamDetails.marks}", style: subheadStyle),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text("${teamDetails.isSelected}", style: subheadStyle),
              ),
            ]),
      ]),
      Divider(),
    ]);
  }
}

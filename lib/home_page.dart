import 'package:flutter/material.dart';
/* import 'package:notes/create_note_page.dart'; */

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notes = <String>["Primeiro Item"];
  /* final ButtonStyle style =
      ElevatedButton.styleFrom(minimumSize: Size(200, 100)); */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NOTES"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var i = 0; i < notes.length; i++)
              Card(
                child: ListTile(
                  title: Text(notes[i]),
                  onTap: () async {
                    var response = await Navigator.pushNamed(
                        context, "/create-note",
                        arguments: notes[i]);
                    if (response != null) {
                      var description = response as String;
                      if (response.isEmpty) {
                        notes.removeAt(i);
                      } else {
                        notes[i] = description;
                      }
                      setState(() {});
                    }
                  },
                ),
              ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 90, 0, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(300, 45), elevation: 5),
                child: Text('TO ADD'),
                onPressed: () async {
                  var description =
                      await Navigator.pushNamed(context, "/create-note");
                  if (description != null) {
                    notes.add(description as String);
                    setState(() {});
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

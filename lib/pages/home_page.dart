import 'dart:io';
import 'package:bands_name/models/band_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [
    Band(id: '1', names: 'Metalica', votes: 5),
    Band(id: '2', names: 'Queen', votes: 5),
    Band(id: '3', names: 'Heroes', votes: 5),
    Band(id: '4', names: 'Bon Jovi', votes: 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          'Bands Names',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, i) {
          return _bandTile(bands[i]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 1,
        onPressed: addNewBand,
      ),
    );
  }

  Widget _bandTile(Band band) {
    return Dismissible(
      direction: DismissDirection.startToEnd,
      key: Key(band.id),
      background: Container(
        padding: EdgeInsets.only(left: 8.0),
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Delete Band',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(band.names.substring(0, 2)),
          backgroundColor: Colors.blue[100],
        ),
        title: Text(band.names),
        trailing: Text(
          '${band.votes}',
          style: TextStyle(fontSize: 20),
        ),
        onTap: () {
          print(band.names);
        },
      ),
    );
  }

  addNewBand() {
    final textController = new TextEditingController();

    (Platform.isAndroid)
        ? showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('New band name'),
                content: TextField(
                  controller: textController,
                ),
                actions: <Widget>[
                  MaterialButton(
                      child: Text('Add'),
                      elevation: 5,
                      textColor: Colors.blue,
                      onPressed: () => addBandToList(textController.text)),
                ],
              );
            })
        : showCupertinoDialog(
            context: context,
            builder: (_) {
              return CupertinoAlertDialog(
                title: Text('New Band Name:'),
                content: CupertinoTextField(
                  controller: textController,
                ),
                actions: <Widget>[
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text('Add'),
                    onPressed: () => addBandToList(textController.text),
                  ),
                  CupertinoDialogAction(
                    isDestructiveAction: true,
                    child: Text('Dismiss'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              );
            });
  }

  void addBandToList(String name) {
    print(name);

    if (name.length > 1) {
      //podemosm
      this.bands.add(new Band(id: DateTime.now().toString(), names: name));
      setState(() {});
    }
    Navigator.pop(context);
  }
}

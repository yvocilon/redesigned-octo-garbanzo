import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  TextEditingController _usernameTextController;
  TextEditingController _passwordTextController;

  @override
  void initState() {
    super.initState();
    _usernameTextController = new TextEditingController();
    _passwordTextController = new TextEditingController();
  }

  Widget build(BuildContext context) {
    return SafeArea(
        minimum: EdgeInsets.all(25),
        child: Column(children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              child: CupertinoTextField(
                placeholder: 'john@doe.com',
                controller: _usernameTextController,
              )),
          CupertinoTextField(
            obscureText: true,
            controller: _passwordTextController,
            placeholder: 'strongpassword',
          ),
          CupertinoButton(
              child: Text("Click"),
              onPressed: () =>
                  _showDialog(context, _usernameTextController.text))
        ]));
  }

  void _showDialog(BuildContext context, String text) {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
              title: new Text("Yo"),
              content: new Text(text),
              actions: <Widget>[
                CupertinoButton(
                  child: Text("close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ]);
        });
  }
}

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _unfocusedColor = Colors.green[600];
  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _usernameFocusNode.addListener(() {
      setState(() {});
    });

    _passwordFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/diamond.png'),
                SizedBox(height: 16.0),
                Text('Sun* Rewarding System',
                    style: Theme.of(context).textTheme.headline5)
              ],
            ),
            SizedBox(height: 120.0),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(
                      color: _usernameFocusNode.hasFocus
                          ? Theme.of(context).accentColor
                          : _unfocusedColor)),
              controller: _usernameController,
              focusNode: _usernameFocusNode,
            ),
            SizedBox(
              height: 12.0,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      color: _passwordFocusNode.hasFocus
                          ? Theme.of(context).accentColor
                          : _unfocusedColor)),
              obscureText: true,
              focusNode: _passwordFocusNode,
              controller: _passwordController,
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                    onPressed: () {
                      _usernameController.clear();
                      _passwordController.clear();
                    },
                    child: Text('CANCEL')),
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('NEXT'),
                  elevation: 8.0,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

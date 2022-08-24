import 'package:flutter/material.dart';
import 'settings.dart';

class card extends StatefulWidget {
  static const String id = '1stpage';
  //final String mydata;
  //card(this.mydata);

  @override
  State<card> createState() => _cardState();
}

class _cardState extends State<card> {
  late String _name;
  String _jobs = '';
  String _num = '';
  String _mail = '';
  @override
  void initState() {
    // TODO: implement initState
    getNamePreferende().then((
      String? name,
    ) async {
      setState(() {
        this._name = name!;
      });
    });
    getjobPreferende().then((
      String? jobs,
    ) async {
      setState(() {
        this._jobs = jobs!;
      });
    });

    getNumPreferende().then((
      String? num,
    ) async {
      setState(() {
        this._num = num!;
      });
    });
    getmailPreferende().then((
      String? mail,
    ) async {
      setState(() {
        this._mail = mail!;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: null,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.settings_applications_rounded),
                onPressed: () {
                  _awaitReturnValueFromSecondScreen(context);
                  _awaitReturnValueFromSecondScreen1(context);
                  _awaitReturnValueFromSecondScreen2(context);
                  _awaitReturnValueFromSecondScreen3(context);
                }),
          ],
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.teal,
        body: SafeArea(
            // we use a safe area to aid visibility to the user
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('images/download.jpg'),
            ),
            Text(
              _name,
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico'),
            ),
            Text(
              _jobs,
              style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 2.5,
                  color: Colors.teal.shade100,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Source Sans pro'),
            ),
            SizedBox(
              height: 20.00,
              width: 190.0,
              child: Divider(color: Colors.teal.shade100),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.9),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.teal,
                ),
                title: Text(
                  _num,
                  style: TextStyle(
                      color: Colors.teal.shade900,
                      fontSize: 20.0,
                      fontFamily: 'Source Sans pro'),
                ),
              ),
            ),
            Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.9),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                  title: Text(
                    _mail,
                    style: TextStyle(
                        color: Colors.teal.shade900,
                        fontSize: 20.0,
                        fontFamily: 'Source Sans pro'),
                  ),
                ))
          ],
        )),
      ),
    );
  }

  void _awaitReturnValueFromSecondScreen(BuildContext context) async {
    final newvalue = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => customizw(
              value: _name,
            )));

    // after the SecondScreen result comes back update the Text widget with it
    setState(() {
      this._name = newvalue;
    });
  }

  void _awaitReturnValueFromSecondScreen1(BuildContext context) async {
    final newvalue1 = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => customizw(
              value: _jobs,
            )));

    // after the SecondScreen result comes back update the Text widget with it
    setState(() {
      this._jobs = newvalue1;
    });
  }

  void _awaitReturnValueFromSecondScreen2(BuildContext context) async {
    final newvalue2 = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => customizw(
              value: _num,
            )));

    // after the SecondScreen result comes back update the Text widget with it
    setState(() {
      this._num = newvalue2;
    });
  }

  void _awaitReturnValueFromSecondScreen3(BuildContext context) async {
    final newvalue3 = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => customizw(
              value: _mail,
            )));

    // after the SecondScreen result comes back update the Text widget with it
    setState(() {
      this._mail = newvalue3;
    });
  }
}

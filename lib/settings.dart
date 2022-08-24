import 'package:flutter/material.dart';

//import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '1stpage.dart';

class customizw extends StatefulWidget {
  static const String id = 'custom1';
  final String value;

  const customizw({
    required this.value,
  });

  @override
  State<customizw> createState() => _customizwState();
}

class _customizwState extends State<customizw> {
  TextEditingController txtController = TextEditingController();
  TextEditingController txtController1 = TextEditingController();
  TextEditingController txtController2 = TextEditingController();
  TextEditingController txtController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void _printLatestValue() {
      print('Second text field: ${txtController.text}');
    }

    @override
    void initState() {
      super.initState();

      // Start listening to changes.
      txtController.addListener(_printLatestValue);
    }

    @override
    void dispose() {
      // Clean up the controller when the widget is removed from the widget tree.
      // This also removes the _printLatestValue listener.
      txtController.dispose();
      txtController1.dispose();
      txtController2.dispose();
      txtController3.dispose();

      super.dispose();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  //Implement logout functionality
                }),
          ],
        ),
        body: SettingsList(
          sections: [
            SettingsSection(
              title: Text('Name'),
              tiles: [
                SettingsTile(
                  title: TextField(
                    controller: txtController,
                  ),
                  //trailing: Text('English'),
                  leading: Icon(Icons.person),
                  trailing: IconButton(
                      icon: Icon(Icons.save),
                      onPressed: () {
                        savename(context);
                      }),
                  onPressed: (BuildContext context) {},
                ),
              ],
            ),
            SettingsSection(
              title: Text('Job'),
              tiles: [
                SettingsTile(
                  title: TextField(
                    controller: txtController1,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.black),
                        hintText: txtController1.text),
                  ),
                  //trailing: Text('English'),
                  leading: Icon(Icons.person),
                  trailing: IconButton(
                      icon: Icon(Icons.work),
                      onPressed: () {
                        savejobs(context);
                      }),
                  onPressed: (BuildContext context) {},
                ),
              ],
            ),
            SettingsSection(
              title: Text('Your Phone number'),
              tiles: [
                SettingsTile(
                  title: TextField(
                    controller: txtController2,
                  ),
                  //trailing: Text('English'),
                  leading: Icon(Icons.person),
                  trailing: IconButton(
                      icon: Icon(Icons.phone_iphone),
                      onPressed: () {
                        savenumber(context);
                      }),
                  onPressed: (BuildContext context) {},
                ),
              ],
            ),
            SettingsSection(
              title: Text('Mail'),
              tiles: [
                SettingsTile(
                  title: TextField(
                    controller: txtController3,
                  ),
                  //trailing: Text('English'),
                  leading: Icon(
                    Icons.mail_lock,
                  ),
                  trailing: IconButton(
                      icon: Icon(Icons.save),
                      onPressed: () {
                        savemail(context);
                      }),
                  onPressed: (BuildContext context) {},
                ),
              ],
            ),
          ],
        ));
  }

  void savename(BuildContext context) {
    String name = txtController.text;
    saveNamePreference(name).then((bool committed) {
      Navigator.of(context).pop(name);
    });
  }

  void savejobs(BuildContext context) {
    String jobs = txtController1.text;
    savejobPreference(jobs).then((bool committed) {
      Navigator.of(context).pop(jobs);
    });
  }

  void savenumber(BuildContext context) {
    String num = txtController2.text;
    saveNumPreference(num).then((bool committed) {
      Navigator.of(context).pop(num);
    });
  }

  void savemail(BuildContext context) {
    String mail = txtController3.text;
    savemailPreference(mail).then((bool committed) {
      Navigator.of(context).pop(mail);
    });
  }
}

Future<bool> saveNamePreference(String name) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('name', name);
  return prefs.commit();
}

Future<bool> savejobPreference(String jobs) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('jobs', jobs);
  return prefs.commit();
}

Future<bool> saveNumPreference(String num) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('num', num);
  return prefs.commit();
}

Future<bool> savemailPreference(String mail) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('mail', mail);
  return prefs.commit();
}

Future<String?> getNamePreferende() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? name = prefs.getString('name');
  return name;
}

Future<String?> getjobPreferende() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? jobs = prefs.getString('jobs');
  return jobs;
}

Future<String?> getNumPreferende() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? num = prefs.getString('num');
  return num;
}

Future<String?> getmailPreferende() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? mail = prefs.getString('mail');
  return mail;
}

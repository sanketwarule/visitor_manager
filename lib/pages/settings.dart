import 'package:flutter/material.dart';
import 'package:visitor_manager/pages/enrollment.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings",style: TextStyle(fontFamily: 'Raleway'),),),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            
            
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  FlatButton(child: Text("Enroll Data",style: TextStyle(color: Colors.white, fontSize: 18.0),),
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Enrollment()));
                    }, ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  FlatButton(child: Text("View Enrolled Data",style: TextStyle(color: Colors.white, fontSize: 18.0),),
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Enrollment()));
                    }, ),
                ],
              ),
            )
          ],
        ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}

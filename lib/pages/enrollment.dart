import 'package:flutter/material.dart';

class Enrollment extends StatefulWidget {
  @override
  _EnrollmentState createState() => _EnrollmentState();
}

class _EnrollmentState extends State<Enrollment> {

  TextEditingController nameController = new TextEditingController();
  TextEditingController mobileController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Enrollment"),),
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    body: Column(
      children: <Widget>[
        FormField(builder: (context){
          return Column(
            children: <Widget>[
              TextFormField(
                initialValue: "Name",
                controller: nameController,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.white),
              )
            ],
          );
        })
      ],
    ),);
  }
}

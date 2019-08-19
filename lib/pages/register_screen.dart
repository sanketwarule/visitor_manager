import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:visitor_repository/visitor_repository.dart';

typedef OnSaveCallback = Function(String name, String mobile, String email, String host, String purpose, String checkIn, String checkOut,String date);

class RegisterScreen extends StatefulWidget {
  final bool isEditing;
  final OnSaveCallback onSave;
  final Visitor visitor;

  RegisterScreen({
    Key key,
    @required this.onSave,
    @required this.isEditing,
    this.visitor,
  }) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _mobile,_name,_email,_host, _purpose, _checkIn,_checkOut, _date;


  bool get isEditing => widget.isEditing;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditing ? 'Edit Todo' : 'Add Todo',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: isEditing ? widget.visitor.name : '',
                maxLines: 1,
                autofocus: !isEditing,
                style: textTheme.subhead,
                decoration: InputDecoration(
                  labelText: 'Enter Name',
                ),
                validator: (val) {
                  return val.trim().isEmpty ? 'Please enter name' : null;
                },
                onSaved: (value) => _name = value,
              ),
              TextFormField(
                initialValue: isEditing ? widget.visitor.mobile : '',
                maxLines: 1,
                maxLength: 10,
                style: textTheme.subhead,
                buildCounter: (BuildContext context, { int currentLength, int maxLength, bool isFocused }) => null,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Mobile',
                ),
                validator: (val){
                  return val.trim().isEmpty ? 'Please enter mobile' : null;
                },
                onSaved: (value) => _mobile = value,
              ),

              TextFormField(
                initialValue: isEditing ? widget.visitor.email : '',
                maxLines: 1,
                style: textTheme.subhead,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: (val){
                  return val.trim().isEmpty ? 'Please enter email' : null;
                },
                onSaved: (value) => _email = value,
              ),

              TextFormField(
                initialValue: isEditing ? widget.visitor.host : '',
                maxLines: 1,
                style: textTheme.subhead,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Host',
                ),
                validator: (val){
                  return val.trim().isEmpty ? 'Please enter host' : null;
                },
                onSaved: (value) => _host = value,
              ),

              TextFormField(
                initialValue: isEditing ? widget.visitor.purpose : '',
                maxLines: 1,
                style: textTheme.subhead,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Purpose',
                ),
                validator: (val){
                  return val.trim().isEmpty ? 'Please enter purpose' : null;
                },
                onSaved: (value) => _purpose = value,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: isEditing ? 'Save changes' : 'Add Todo',
        child: Icon(isEditing ? Icons.check : Icons.add),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            widget.onSave(_name, _mobile, _email, _host, _purpose, TimeOfDay.now().toString(), null, DateTime.now().toIso8601String());
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visitor_manager/assets.dart';
import 'package:visitor_manager/blocs/blocs.dart';
import 'package:visitor_manager/pages/settings.dart';
import 'package:visitor_repository/visitor_repository.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _mobileTextEditingController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mobileTextEditingController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
//    final _loginFormKey = GlobalKey<FormState>();
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    final backgroundImage = Image.asset(ImageAssets.backgroundImage,
      fit: BoxFit.cover,
    );

    final content = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Visitor App", style: TextStyle(fontFamily: 'Raleway',color: Theme.of(context).accentColor,fontStyle: FontStyle.normal,fontWeight: FontWeight.bold,fontSize: 36.0),),

          Form(
//            key: _loginFormKey,
            child:
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: TextFormField(controller: _mobileTextEditingController,validator: mobileValidator,
              style: Theme.of(context).textTheme.subhead, maxLength: 10,
              buildCounter: (BuildContext context, { int currentLength, int maxLength, bool isFocused }) => null, keyboardType: TextInputType.phone, decoration: InputDecoration(icon: Icon(Icons.phone_android, color: Theme.of(context).iconTheme.color,), labelText: "Mobile", labelStyle: TextStyle(color: Theme.of(context).accentColor,decorationColor: Theme.of(context).accentColor)),),
          ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              FlatButton(
                child: CircleAvatar(
                  backgroundColor: Colors.indigoAccent.withOpacity(0.3),
                  radius: 55.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.arrow_forward,color: Colors.white,size: 50.0,),
                      Text("Sign in")
                    ],
                  ),
                ),
                onPressed: (){
//                  if(_loginFormKey.currentState.validate()) {
                    homeBloc.dispatch(CheckIn(
                        Visitor(_mobileTextEditingController.text.trim())));
//                  }
                },
              ),

              FlatButton(
                child: CircleAvatar(
                  backgroundColor: Colors.indigoAccent.withOpacity(0.3),
                  radius: 55.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.arrow_back,color: Colors.white,size: 50.0,),
                      Text("Sign out")
                    ],
                  ),
                ),
                onPressed: (){},
              ),
            ],
          ),

          FlatButton(
            child: Text("Login as Admin",style: TextStyle(color: Colors.deepPurpleAccent,fontSize: 18.0),),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Settings()),
              );            },)

        ],
      ),
    );

    return
    Scaffold(
        body:

        BlocListener<HomeBloc, HomeState>(
          listener: (BuildContext context, HomeState state) {
            print('inside BlocListener');
            if (state is NavigateToRegisterState) {
              print('inside Home Loaded');
              Navigator.of(context).pushNamed('/checkIn');
            }else if (state is AlreadyRegisteredState){
              print('inside SnackBarState');
              Scaffold.of(context).showSnackBar(SnackBar(content: Text("snackbar")));
            }
          },

       child: BlocBuilder<HomeBloc, HomeState>(

         builder:(context, state) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  backgroundImage,
                  content,
                ],
              );
         }
       ),
    ),
      floatingActionButton: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () {
            homeBloc.dispatch(CheckIn(Visitor(_mobileTextEditingController.text)));
          },
        ),
      ],
    ),
    );
  }

  String mobileValidator(String value){
    if(value.isEmpty)
      return 'Mobile number cannot be empty';

  }

}

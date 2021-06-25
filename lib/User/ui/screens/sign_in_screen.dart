import 'package:flutter/material.dart';
import '../../../widgets/gradient_back.dart';
import '../../../widgets/button_green.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../trips_cupertino.dart';
import 'package:flutter_application_1/User/bloc/bloc_user.dart';



class SignInScreen extends StatefulWidget {

  @override
  State createState() {
    return _SignInScreen();
  }
}


class _SignInScreen extends State<SignInScreen> {

UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    userBloc = BlocProvider.of(context);
    return _handleCurrentSession(); //signInGoogleUI();
  }

  Widget _handleCurrentSession(){
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //snapshot- data - Object User
        if(!snapshot.hasData || snapshot.hasError) {
          return signInGoogleUI();
        } else {
          return TripsCupertino();
        }
      },
    );

  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack("", null),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Welcome \n This is your Travel App",
                style: TextStyle(
                  fontSize: 37.0,
                  fontFamily: "Lato",
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
              ButtonGreen(
                text: "Login with Gmail", 
                onPressed: (){
                  userBloc.signOut();
                  userBloc.signIn().then((FirebaseUser user) => print("user"));
                  /*
                  userBloc.signIn().then((FirebaseUser user) {
                    userBloc.updateUserData(User(
                      uid: user.uid,
                      name: user.displayName,
                      email: user.email,
                      photoURL: user.photoUrl
                    ));
                  });
                  */
                },
                width:300.0,
                height:50.0)

            ],
          )
        ],
      ),
    );
  }


}
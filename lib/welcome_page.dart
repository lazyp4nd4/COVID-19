import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.teal.shade300, Colors.teal.shade800],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                'assets/images/doctor-woman.svg',
                width: 150,
              ),
              SizedBox(
                width: 20,
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'One-stop\ndestination for\nall COVID-19\nrelated\nqueries.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'assets/fonts/Poppins/Poppins-Bold.ttf'),
                  ),
                  SizedBox(height: 20,),
                  RaisedButton(
                    padding: EdgeInsets.all(0.0),
                    onPressed: (){
                      Navigator.pushNamed(context, '/main_page');
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.white, Colors.white70],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(20.0),
                        constraints: BoxConstraints(minHeight: 80.0, minWidth: 200.0),
                        child: Text(
                          'More\nInformation.',
                          style: TextStyle(
                            color: Colors.teal.shade700,
                            fontFamily: 'assets/fonts/Poppins/Poppins-Bold.ttf',
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

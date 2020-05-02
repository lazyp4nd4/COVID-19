import 'package:covid19/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:url_launcher/url_launcher.dart';
class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 150,
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.lightBlue.shade200,
                        Colors.lightBlue.shade600
                      ],
                      end: Alignment.bottomLeft,
                      begin: Alignment.topRight,
                    ),
                    image: DecorationImage( image:ExactAssetImage('assets/images/virus.png'), alignment: Alignment.topRight ),

                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30,), onPressed: () => Navigator.pop(context),),
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 20),
                      child: Text(
                        'Quick Virtual Test:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Carousel(),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Prevention',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'assets/fonts/Poppins/Poppins-Bold.ttf'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: SizedBox(
                  height: 156,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: <Widget>[
                      Container(
                        height: 136,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 8),
                                  blurRadius: 24,
                                  color: Colors.white10)
                            ]),
                      ),
                      Image.asset(
                        'assets/images/wash_hands.png',
                        alignment: Alignment.topCenter,
                      ),
                      Positioned(
                        left: 210,
                        child: Container(
                            child: Text(
                              'Wash hands\nrepeatedly for\natleast\n20 seconds.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily:
                                  'assets/fonts/Poppins/Poppins-Medium.ttf',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            )),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: SizedBox(
                  height: 156,
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: <Widget>[
                      Container(
                        height: 136,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 8),
                                  blurRadius: 24,
                                  color: Colors.white10)
                            ]),
                      ),
                      Image.asset(
                        'assets/images/wear_mask.png',
                        alignment: Alignment.topCenter,
                      ),
                      Positioned(
                        right: 210,
                        child: Container(
                            child: Text(
                              'Wear mask\nwhenever you\ndecide to\ngo out.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily:
                                  'assets/fonts/Poppins/Poppins-Medium.ttf',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            )),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Helpline',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'assets/fonts/Poppins/Poppins-Bold.ttf'),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0)),
                    gradient: LinearGradient(
                      colors: [
                        Colors.lightBlue.shade300,
                        Colors.lightBlue.shade700
                      ],
                      end: Alignment.bottomLeft,
                      begin: Alignment.topRight,
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'In case of an emergency or doubt, contact Government Helpline:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'assets/fonts/Poppins/Poppins-Bold.ttf',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    GestureDetector(
                      onTap: () => launch('tel:1075'),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.phone,
                            color: Colors.white,
                            size: 30.0,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            '1075',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily:
                              'assets/fonts/Poppins/Poppins-Bold.ttf',
                              fontWeight: FontWeight.w800,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      )
    );
  }
}

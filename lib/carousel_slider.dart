import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {

  int _current = 0;
  int rightAnswer = 0;
  CarouselSlider carousalSlider;
  int wrongAnswer = 0;
  static Color yesSelected = Colors.green.shade300;
  static Color yesUnselected = Colors.green.shade100;
  static Color noSelected = Colors.red.shade300;
  static Color noUnselected = Colors.red.shade100;
  Color yesColour1 = yesUnselected;Color noColour1 = noUnselected;
  Color yesColour2 = yesUnselected;Color noColour2 = noUnselected;
  Color yesColour3 = yesUnselected;Color noColour3 = noUnselected;

  @override
  Widget build(BuildContext context) {
    return carousalSlider = CarouselSlider(
      height: 400,
      enableInfiniteScroll: false,
      enlargeCenterPage: true,
      onPageChanged: (index){
        setState(() {
          _current = index;
        });
      },
      initialPage: 0,
      items: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: RadialGradient(
              colors: [
                Colors.lightBlue.shade200,
                Colors.white,
              ],
            )
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Are you experiencing any of the following symptoms?',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              //Symptoms cards
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 20,
                            color: Colors.white70,
                          )
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/headache.png', height: 70,),
                          Text('Headache', style: TextStyle( color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10))
                        ],
                      )
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 20,
                              color: Colors.white70,
                            )
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Image.asset('assets/images/caugh.png', height: 70,),
                            Text('Cough', style: TextStyle( color: Colors.black, fontWeight: FontWeight.bold,fontSize: 10))
                          ],
                        )
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 20,
                              color: Colors.white70,
                            )
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Image.asset('assets/images/fever.png', height: 70,),
                            Text('Fever', style: TextStyle( color: Colors.black, fontWeight: FontWeight.bold,fontSize: 10))
                          ],
                        )
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          wrongAnswer++;
                          yesColour1 = yesSelected;
                          noColour1 = noUnselected;

                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: yesColour1,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 40,
                        width: 100,
                        child: Center(
                          child: Text(
                            'YES',
                            style: TextStyle(
                              color: Colors.green.shade800,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          rightAnswer++;
                          yesColour1 = yesUnselected;
                          noColour1 = noSelected;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: noColour1,
                          borderRadius: BorderRadius.circular(10),

                        ),
                        height: 40,
                        width: 100,
                        child: Center(
                          child: Text(
                            'NO',
                            style: TextStyle(
                              color: Colors.red.shade700,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
              gradient: RadialGradient(
                colors: [
                  Colors.lightBlue.shade200,
                  Colors.white,
                ],
              )
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Did you visit any other country recently?',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Icon(MaterialCommunityIcons.globe_model, size: 200, color: Colors.lightGreen,),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          wrongAnswer++;
                          yesColour2 = yesSelected;
                          noColour2 = noUnselected;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: yesColour2,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 40,
                        width: 100,
                        child: Center(
                          child: Text(
                            'YES',
                            style: TextStyle(
                              color: Colors.green.shade700,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          rightAnswer++;
                          yesColour2 = yesUnselected;
                          noColour2 = noSelected;

                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: noColour2,
                          borderRadius: BorderRadius.circular(10),

                        ),
                        height: 40,
                        width: 100,
                        child: Center(
                          child: Text(
                            'NO',
                            style: TextStyle(
                              color: Colors.red.shade700,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
              gradient: RadialGradient(
                colors: [
                  Colors.lightBlue.shade200,
                  Colors.white,
                ],
              )
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Have you maintained Social Distancing?',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SvgPicture.asset('assets/images/mask-man.svg', width: 150, fit: BoxFit.fitWidth,),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          rightAnswer++;
                          yesColour3 = yesSelected;
                          noColour3 = noUnselected;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: yesColour3,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 40,
                        width: 100,
                        child: Center(
                          child: Text(
                            'YES',
                            style: TextStyle(
                              color: Colors.green.shade700,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          wrongAnswer++;
                          yesColour3 = yesUnselected;
                          noColour3 = noSelected;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: noColour3,
                          borderRadius: BorderRadius.circular(10),

                        ),
                        height: 40,
                        width: 100,
                        child: Center(
                          child: Text(
                            'NO',
                            style: TextStyle(
                              color: Colors.red.shade700,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        result(wrongAnswer),
      ],
    );
  }
}


Widget result (int wrongAnswer){

  if(wrongAnswer == 0){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: RadialGradient(
            colors: [
              Colors.green.shade200,
              Colors.lightGreen,
            ],
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'You are safe from Coronavirus!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.green.shade900,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          Icon(MaterialCommunityIcons.emoticon_happy_outline, color: Colors.green.shade900, size: 200,),

        ],
      ),
    );
  }else if(wrongAnswer == 1){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: RadialGradient(
            colors: [
              Colors.orange.shade200,
              Colors.orange.shade50,
            ],
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'You need to take precautions!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.orange.shade900,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          Icon(MaterialCommunityIcons.emoticon_neutral_outline, color: Colors.orange, size: 200,),

        ],
      ),
    );
  }else{
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: RadialGradient(
            colors: [
              Colors.red.shade200,
              Colors.red.shade50,
            ],
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Consult a doctor ASAP!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red.shade900,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          Icon(MaterialCommunityIcons.emoticon_sad_outline, color: Colors.red, size: 200,),

        ],
      ),
    );
  }

}
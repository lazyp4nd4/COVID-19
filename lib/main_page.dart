import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final String statUrl = "https://api.rootnet.in/covid19-in/stats/latest";
  dataIndia stats;

  Future<dataIndia> getStats() async {
    var res = await http.get(statUrl);
    if(res.statusCode == 200){
      final data = jsonDecode(res.body);
      return dataIndia.fromJson(data["data"]["summary"]);
    }
    else throw Exception('kuch toh gadbad hai babu bhaiya!');
  }

  String _launchUrl = "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/technical-guidance";

  Future<void> _launchInBrowser(String url) async{
    if(await canLaunch(url))
      {
        await launch(url);
      }
    else{
      throw Exception('cannot launch');
    }
  }

//  @override
//  void initState() {
//    getStats();
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 250,
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.lightBlue.shade200,
                      Colors.lightBlue.shade600
                    ],
                    end: Alignment.bottomLeft,
                    begin: Alignment.topRight,
                  ),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0))),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'COVID- 19',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'assets/fonts/Poppins/Poppins-Bold.ttf',
                              color: Colors.white),
                        ),
                        Text(
                          'This app helps to spread awareness about the deadly Coronavirus. It features a Quick Virtual test to analyze how probable you are of being effected.',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily:
                                  'assets/fonts/Poppins/Poppins-Regular.ttf'),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: SvgPicture.asset(
                      'assets/images/remote-work-woman.svg',
                      width: 150,
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            //QUICK TEST
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/test');
              },
              child: Padding(
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
                      SvgPicture.asset(
                        'assets/images/doctor-man.svg',
                        fit: BoxFit.fitWidth,
                        width: 210,
                        alignment: Alignment.topCenter,
                      ),
                      Positioned(
                        right: 180,
                        child: Container(
                            child: Text(
                          'Take a Quick\nVirtual Test',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  'assets/fonts/Poppins/Poppins-Medium.ttf',
                              fontSize: 25,
                              fontWeight: FontWeight.w700),
                        )),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            //STATISTICS
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'Live Indian Statistics',
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
            //STATISTICS - ROW
            FutureBuilder(
              future: getStats(),
              builder: (BuildContext context, Snapshot){
                if(Snapshot.hasData)
                  {
                    final covid = Snapshot.data;
                    return Row(
                      children: <Widget>[
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: Container(
                            height: 150,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 10),
                                      blurRadius: 20,
                                      color: Colors.white10)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SpinKitPulse(
                                  color: Colors.amber,
                                  size: 30,
                                ),
                                Text(
                                  '${covid.total}',
                                  style: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 25,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Confirmed\ncases',
                                  style: TextStyle(color: Colors.grey),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Expanded(
                          child: Container(
                            height: 150,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 10),
                                      blurRadius: 20,
                                      color: Colors.white10)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SpinKitPulse(
                                  color: Colors.red,
                                  size: 30,
                                ),
                                Text(
                                  '${covid.deaths}',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 25,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Deceased',
                                  style: TextStyle(color: Colors.grey),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Expanded(
                          child: Container(
                            height: 150,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 10),
                                      blurRadius: 20,
                                      color: Colors.white10)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SpinKitPulse(color: Colors.green, size: 30),
                                Text(
                                  '${covid.discharged}',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 25,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Recovered Cases',
                                  style: TextStyle(color: Colors.grey),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                      ],
                    );
                  }
                else return Container();
              },
            ),

            SizedBox(
              height: 10.0,
            ),
            GestureDetector(
              onTap: () {
                _launchInBrowser(_launchUrl);
              },
              child: Padding(
                padding: EdgeInsets.only(top: 20.0, left: 20, right: 20, bottom: 20),
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
                      'assets/images/icons8-world-health-organization-96.png',
                      fit: BoxFit.fitWidth,
                      width: 150,
                      alignment: Alignment.topCenter,
                    ),
                    Positioned(
                      left: 180,
                      child: Container(
                          child: Text(
                            'Have a look \nat WHO\nguidelines',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily:
                                'assets/fonts/Poppins/Poppins-Medium.ttf',
                                fontSize: 25,
                                fontWeight: FontWeight.w700),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class dataIndia{
  int confirmedCasesIndian;
  int confirmedCasesForeign;
  int discharged;
  int deaths;
  int total;
  int confirmedButLocationUnidentified;

  dataIndia( this.confirmedCasesIndian, this.discharged, this.confirmedButLocationUnidentified ,this.total, this.deaths, this.confirmedCasesForeign );

  dataIndia.fromJson(Map<String, dynamic> json)
      : confirmedCasesIndian = json['confirmedCasesIndian'],
        confirmedCasesForeign = json['confirmedCasesForeign'],
        discharged = json['discharged'],
        deaths = json['deaths'],
        total = json['total'],
        confirmedButLocationUnidentified = json['confirmedButLocationUnidentified'];

  Map<String, dynamic> toJson() =>
      {
        'confirmedCasesIndian': confirmedCasesIndian,
        'confirmedButLocationUnidentified': confirmedButLocationUnidentified,
        'confirmedCasesForeign': confirmedCasesForeign,
        'total': total,
        'deaths': deaths,
        'discharged': discharged,
      };

}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/pages/home/homepage.dart';

class OnBoarding extends StatefulWidget {


  final Function toggleView;
  OnBoarding({required this.toggleView});
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor:Colors.white,
          body: Container(
            margin: const EdgeInsets.fromLTRB(100, 80, 80, 0),
            child:Column(
                children:[
                  Text('GUC',
                      style: TextStyle(
                          fontSize: 50,
                          fontFamily: 'misto',
                          color: Colors.lightBlue[800],
                          letterSpacing: 16

                      )),
                  Container(
                    margin: EdgeInsets.fromLTRB(19, 0, 30, 0),
                    child:
                    Column(
                        children :[ Text('GUI',
                            style: TextStyle(
                              fontSize: 50,
                              fontFamily: 'misto',
                              color: Colors.lightBlue[800],
                              letterSpacing: 20,
                            )),
                          Text('DE',style: TextStyle(
                            fontSize: 50,
                            fontFamily: 'misto',
                            color: Colors.lightBlue[800],
                            letterSpacing: 20,
                          )),
                        ]

                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.lightBlue, width: 1, ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0,0 ),
                      child: Column(
                          children: [
                            Container(
                                width: 11,
                                height: 11,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.lightBlue[800],
                                )
                            ),
                            Container(
                              width: 1,
                              height: 120,
                              color: Colors.lightBlue[800],
                            ),
                            Container(
                              width: 11,
                              height: 11,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.lightBlue[800],
                              ),
                            ),

                          ]
                      )
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        margin:EdgeInsets.fromLTRB(0, 0, 0, 10),
                        width: 312,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(36.18),
                          color: Color(0xcc1c1b1f),
                        ),
                      ),
                      Positioned(
                        top: 15,
                        left: 27,
                        child: Padding(
                          padding: const EdgeInsets.only(right:3.0,bottom: 3.0),
                          child: InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, '/homepage');
                            },
                            child: Row(
                              children: [
                                Text(
                                  "Tours of GUC",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(width: 35),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        margin:EdgeInsets.fromLTRB(0, 0, 0, 10),
                        width: 312,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(36.18),
                          color: Color(0xcc1c1b1f),
                        ),
                      ),
                      Positioned(
                        top: 7,
                        left: 30,
                        child: Padding(
                          padding: const EdgeInsets.only(top:8.0,right: 9.0),
                          child: InkWell(
                            onTap: (){
                              widget.toggleView();
                            },
                            child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Login as Admin",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Icon(
                                Icons.person,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]
            ),
          ),

        )
    );
  }
}

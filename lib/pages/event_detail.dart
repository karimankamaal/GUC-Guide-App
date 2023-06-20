
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myfirstapp/models/specialevents_model.dart';
import 'package:myfirstapp/widgets/app_icon.dart';
import 'package:myfirstapp/widgets/column.dart';
import 'package:myfirstapp/widgets/expandable_widget.dart';

import '../utils/dimensions.dart';
import '../widgets/IconAndTextWidget.dart';

class EventDetail extends StatelessWidget {
  const EventDetail({Key? key}) : super(key: key);
  String _getOrdinalSuffix(int? day) {
    if (day! >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }
  @override
  Widget build(BuildContext context) {
    SpecialEvent? event=ModalRoute.of(context)?.settings.arguments as SpecialEvent?;
    DateTime? dateTime= event?.date?.toDate();
    String outputDateString = DateFormat('d\'${_getOrdinalSuffix(dateTime?.day)}\' MMMM').format(dateTime!);
    return Scaffold(
        body:Stack(
          children: [
           Positioned(
            left:0,
            right:0,
            child:
            Container(
             width: double.maxFinite,
              height: 350,
              decoration: BoxDecoration(
            color:Colors.lightBlue[800],
                borderRadius: BorderRadius.circular(30)
            ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30), // Same border radius as the outer container
                  child: Image.asset(
                    'lib/assets/ROS in Autonomous Driving.png',
                    fit: BoxFit.cover,
                  ),
                ),

           )),
            Positioned(
              left: 10,
              child:
              Container(
                width: 45,
                height: 45,
                margin: EdgeInsets.only(top:35,left:20),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.lightBlue[800]),
                    onPressed: (){
                      Navigator.pushNamed(context, '/homepage');
                    },
                  ),
                ),
              ),
          Positioned(
              left:80,
              right: 0,
              top:370,
              child: Text(event?.title??'',style: TextStyle(
                fontFamily: 'robotoN',
                fontSize: 30,
              ),)
          ),
            Positioned(
              left:40,
                right:0,
                top: 460,
                child: SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                          Flexible(child: IconAndTextWidget(icon: Icons.location_pin, text: event?.location ?? '', color: Colors.blue, iconColor: Colors.blue)),
                          Flexible(child: IconAndTextWidget(icon: Icons.calendar_month, text: outputDateString, color:Colors.blue, iconColor:Colors.blue))
                     ]
                      ),
                )

                ),
            Positioned(
              top:20,
              left:20,
              child: Container(
                width: 360,
                margin: EdgeInsets.only(top: 520, left: 0),
                child: SingleChildScrollView(
                  child: ExpandableText(text: "During the event, attendees will have the opportunity to explore various aspects of ROS in the context of autonomous driving. The event will cover topics such as the role of ROS in perception, mapping, localization, path planning, and control systems for autonomous vehicles. Expert speakers and industry professionals will share their knowledge, insights, and real-world experiences in leveraging ROS for autonomous driving applications."),
                ),
              ),
            ),




          ],
        )
    );



  }
}

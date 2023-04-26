
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
   print(event?.imageURL);
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
                child: Image.network(event?.imageURL??'')

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
              left:0,
                right:0,
                top: 440,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                        IconAndTextWidget(icon: Icons.location_pin, text: event?.location ?? '', color: Color(0xFFB6ACAC), iconColor: Color(0xafff0000)),
                        IconAndTextWidget(icon: Icons.calendar_month, text: outputDateString, color:Color(0xFFB6ACAC), iconColor:Color(0xafff0000))
                   ]
                    )

                ),
             Container(
               margin: EdgeInsets.only(top:520,left: 10),
               height: 600,
                 child:
             SingleChildScrollView(child:
             ExpandableText( text: event?.description?? ''))),



          ],
        )
    );



  }
}

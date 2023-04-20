import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myfirstapp/models/specialevents_model.dart';

import '../../utils/dimensions.dart';
import '../../widgets/IconAndTextWidget.dart';


class AppColumn2 extends StatelessWidget {

  late final SpecialEvent event;
  AppColumn2({   required this.event});


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
    DateTime? dateTime= event.date?.toDate();
    String outputDateString = DateFormat('d\'${_getOrdinalSuffix(dateTime?.day)}\' MMMM').format(dateTime!);
    return InkWell(
      onTap:(){ Navigator.pushNamed(context, '/eventedit',
          arguments: SpecialEvent(title: event.title,location: event.location,description: event.description,date: event.date,time: event.time));},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height:Dimensions.height10),
          Container(
            padding: EdgeInsets.only(left:10) ,
            child: Text(event.title?? '', style:TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 20,
                fontFamily: 'robotoN'
            )),
          ),
          //SizedBox(height: Dimensions.height10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconAndTextWidget(icon: Icons.location_pin, text: event.location ?? '', color: Color(0xFFB6ACAC), iconColor: Colors.lightBlue),
              IconAndTextWidget(icon: Icons.calendar_month, text: outputDateString, color:Color(0xFFB6ACAC), iconColor:Colors.lightBlue)
            ],
          )


        ],
      ),
    );
  }
}

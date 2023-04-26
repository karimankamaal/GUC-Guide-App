import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myfirstapp/models/specialevents_model.dart';
import 'package:myfirstapp/widgets/app_icon.dart';
import 'package:myfirstapp/widgets/column.dart';
import 'package:myfirstapp/widgets/expandable_widget.dart';

import '../../utils/dimensions.dart';
import '../../widgets/IconAndTextWidget.dart';

class EventEdit extends StatefulWidget {
  const EventEdit({Key? key}) : super(key: key);

  @override
  State<EventEdit> createState() => _EventEditState();

}
class _EventEditState extends State<EventEdit> {
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
    final TextEditingController titleController= TextEditingController();
    final TextEditingController locationController= TextEditingController();
    final TextEditingController descriptionController= TextEditingController();
    late DateTime _date = DateTime(2023);
    Future<void> updateTitle(String eventitle) async {
      await showModalBottomSheet(
        isScrollControlled: true,
          context: context,
          builder: (BuildContext ctx){
          return Padding(
              padding: EdgeInsets.only(top: 20,left:20,right:20,bottom: MediaQuery.of(ctx).viewInsets.bottom +20),
               child: Row(
                 mainAxisSize: MainAxisSize.min,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Expanded(
                     child: TextField(
                       controller: titleController,
                       decoration: InputDecoration(labelText: 'Edit Title'),
                     ),
                   ),
                   IconButton(onPressed: ()async {

                     try {
                       final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('events')
                           .where('title', isEqualTo: eventitle)
                           .get();
                       if (snapshot.docs.isEmpty) {
                         throw Exception('No event found with title $eventitle');
                       }
                       final DocumentSnapshot eventDoc = snapshot.docs.first;
                       debugPrint("got the document ");
                       final String eventId = eventDoc.id;
                       debugPrint("id of document im trying to change");
                       await FirebaseFirestore.instance.collection('events').doc(eventId).update(
                           {
                             'title':titleController.text
                           });
                     } catch(e) {
                       throw Exception("Error updating event: $e");
                     }
                   }, icon: Icon(Icons.check_circle))
            ],
          ),);
          });
    }
    Future<void> updateLocation(String eventitle) async {
      await showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext ctx){
            return Padding(
              padding: EdgeInsets.only(top: 20,left:20,right:20,bottom: MediaQuery.of(ctx).viewInsets.bottom +20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextField(
                      controller: locationController,
                      decoration: InputDecoration(labelText: 'Edit Location'),
                    ),
                  ),
                  IconButton(onPressed: ()async {

                    try {
                      final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('events')
                          .where('title', isEqualTo: eventitle)
                          .get();
                      if (snapshot.docs.isEmpty) {
                        throw Exception('No event found with title $eventitle');
                      }
                      final DocumentSnapshot eventDoc = snapshot.docs.first;
                      debugPrint("got the document ");
                      final String eventId = eventDoc.id;
                      debugPrint("id of document im trying to change");
                      await FirebaseFirestore.instance.collection('events').doc(eventId).update(
                          {
                            'location':locationController.text
                          });
                    } catch(e) {
                      throw Exception("Error updating event: $e");
                    }
                  }, icon: Icon(Icons.check_circle))
                ],
              ),);
          });
    }
    Future<void> updateTime(String eventitle) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2100));
      if (picked != null) {
        try {
          final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('events')
              .where('title', isEqualTo: eventitle)
              .get();
          if (snapshot.docs.isEmpty) {
            throw Exception('No event found with title $eventitle');
          }
          final DocumentSnapshot eventDoc = snapshot.docs.first;
          debugPrint("got the document ");
          final String eventId = eventDoc.id;
          debugPrint("id of document im trying to change");
          await FirebaseFirestore.instance.collection('events').doc(eventId).update(
              {
                'date':picked
              });
        } catch(e) {
          throw Exception("Error updating event: $e");
        }
      }
    }
    Future<void> deleteEvent(String eventitle) async{
      try{
        final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('events')
            .where('title', isEqualTo: eventitle)
            .get();
        if (snapshot.docs.isEmpty) {
          throw Exception('No event found with title $eventitle');
        }
        final DocumentSnapshot eventDoc = snapshot.docs.first;
        debugPrint("got the document ");
        final String eventId = eventDoc.id;
        debugPrint("id of document im trying to change");
        await FirebaseFirestore.instance.collection('myCollection').doc(eventId).delete();
      }
      catch(e){
        throw Exception("Error deleting event: $e");
      }
    }
    Future<void> updateDescription(String eventitle) async {

      await showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext ctx){
            return Padding(
              padding: EdgeInsets.only(top: 20,left:20,right:20,bottom: MediaQuery.of(ctx).viewInsets.bottom +20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextField(
                      controller: descriptionController,
                      decoration: InputDecoration(labelText: 'Edit Description'),
                    ),
                  ),
                  IconButton(onPressed: ()async {

                    try {
                      final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('events')
                          .where('title', isEqualTo: eventitle)
                          .get();
                      if (snapshot.docs.isEmpty) {
                        throw Exception('No event found with title $eventitle');
                      }
                      final DocumentSnapshot eventDoc = snapshot.docs.first;
                      debugPrint("got the document ");
                      final String eventId = eventDoc.id;
                      debugPrint("id of document im trying to change");
                      await FirebaseFirestore.instance.collection('events').doc(eventId).update(
                          {
                            'description':descriptionController.text
                          });
                    } catch(e) {
                      throw Exception("Error updating event: $e");
                    }
                  }, icon: Icon(Icons.check_circle))
                ],
              ),);
          });
    }

    SpecialEvent? event =
    ModalRoute
        .of(context)
        ?.settings
        .arguments as SpecialEvent?;
    DateTime? dateTime = event?.date?.toDate();
    String outputDateString =
    DateFormat('d\'${_getOrdinalSuffix(dateTime?.day)}\' MMMM')
        .format(dateTime!);

    return Scaffold(
      body:  ConstrainedBox(
    constraints: BoxConstraints(
    minHeight: MediaQuery.of(context).size.height,
    minWidth: MediaQuery.of(context).size.width,
    ),
      child:  Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 350,
              decoration: BoxDecoration(
                color: Colors.lightBlue[800],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Image.network(event?.imageURL ?? ''),
            ),
          ),
          Positioned(
            left: 10,
            child: Container(
              width: 45,
              height: 45,
              margin: EdgeInsets.only(top: 35, left: 20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon:
                Icon(Icons.arrow_back_ios, color: Colors.lightBlue[800]),
                onPressed: () {
                  Navigator.pushNamed(context, '/editevent');
                },
              ),
            ),
          ),
          Positioned(
            left: 80,
            right: 0,
            top: 370,
            child: Row(
              children:[
                Text(
              event?.title ?? '',
              style: TextStyle(
                fontFamily: 'robotoN',
                fontSize: 30,
              ),
            ),
                IconButton(onPressed: (){updateTitle(event?.title??'');}, icon: Icon(Icons.edit))
              ],
            )
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 440,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    IconAndTextWidget(
                        icon: Icons.location_pin,
                        text: event?.location ?? '',
                        color: Color(0xFFB6ACAC),
                        iconColor: Color(0xafff0000)),
                    GestureDetector(
                      child: IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Color(0xFFB6ACAC),
                        ),
                        onPressed: () {updateLocation(event?.title ?? '');},
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconAndTextWidget(
                        icon: Icons.calendar_month,
                        text: outputDateString,
                        color: Color(0xFFB6ACAC),
                        iconColor: Color(0xafff0000)),
                    GestureDetector(
                      onTap: () {
                        // navigate to edit date screen
                      },
                      child: IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Color(0xFFB6ACAC),
                        ),
                        onPressed: () {updateTime(event?.title?? '');},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 330,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top:200,left: 10),
                  height: 600,
                  width: 300,
                  child: SingleChildScrollView(
                    child: ExpandableText(

                      text: "cankikb kbk ",

                    ),
                  ),
                ),
                IconButton(onPressed: (){updateDescription(event?.title??'');},
                    icon: Icon(Icons.edit))
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                     deleteEvent(event?.title?? '');
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {

                    },
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
      )
    );
  }

}
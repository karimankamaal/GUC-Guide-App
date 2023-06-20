import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/specialevents_model.dart';
import '../../services/auth.dart';
import '../../services/database.dart';
import '../../utils/dimensions.dart';
import '../../widgets/IconAndTextWidget.dart';
import '../../widgets/column.dart';
import 'app_column2.dart';

class EditRobot extends StatefulWidget {
  const EditRobot({Key? key}) : super(key: key);

  @override
  State<EditRobot> createState() => _EditRobotState();
}

class _EditRobotState extends State<EditRobot> {
  List<QueryDocumentSnapshot> documents = [];
  final AuthService _auth=AuthService();

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

  void _loadDocuments() async {
    List<QueryDocumentSnapshot> mydocuments = await _auth.getCollection('robots');
    setState(() {
      documents = mydocuments;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadDocuments();
  }

  @override
  Widget build(BuildContext context) {
    print(documents.length);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15,left: 20),
              child: Row(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    margin: EdgeInsets.only(right: 190),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                            Icons.arrow_back_ios, color: Colors.lightBlue[800]),
                        onPressed: () {
                          Navigator.pushNamed(context, '/adminhomepage');
                        },
                      ),
                    ),
                  ),
                  Text(
                    'Edit Robots',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Expanded(
              child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: documents.length,
                    itemBuilder: (context, index) {
                      QueryDocumentSnapshot document = documents[index];
                      DateTime? dateTime= document['date'].toDate();
                      String outputDateString = DateFormat('d\'${_getOrdinalSuffix(dateTime?.day)}\' MMMM y').format(dateTime!);
                      List<dynamic> images=document['images'];

                      return GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/editrobotdetail', arguments: document);
                        },
                        child: Column(
                          children: [
                            ListTile(
                              leading: Container(
                                width: 70,
                                height: 130,
                                child: CircleAvatar(child: ClipOval(
                                  child: Stack(
                                    children: [
                                      Image.network(
                                        images[0],
                                        width: 200,
                                        height: 200,
                                        fit: BoxFit.cover,
                                        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null)
                                            return child;
                                          return Center(
                                            child: CircularProgressIndicator(
                                              value: loadingProgress.expectedTotalBytes != null
                                                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                                  : null,
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                ),
                              ),
                              title: Text(document['name'],style: TextStyle(color: Colors.lightBlue[800], fontFamily: 'roboto',fontSize: 17),),
                              subtitle: Text("MRS Lab",style: TextStyle(color: Colors.lightBlue[800], fontFamily: 'robotoT',fontSize: 14),),
                              trailing: IconButton(icon:Icon(Icons.arrow_forward), onPressed: (){},color: Colors.lightBlue,),
                              selectedTileColor: Colors.lightBlue[200],
                            ),
                            SizedBox(height: 14,)
                          ],
                        ),
                      );
                    },
    ),
    )
    ]
        ),
      )
                );


  }
}

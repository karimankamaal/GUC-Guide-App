import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/specialevents_model.dart';
import '../../services/database.dart';
import '../../utils/dimensions.dart';
import '../../widgets/column.dart';
import 'app_column2.dart';

class EditEvent extends StatefulWidget {
  const EditEvent({Key? key}) : super(key: key);

  @override
  State<EditEvent> createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
  List<String> images=['https://firebasestorage.googleapis.com/v0/b/guc-guide.appspot.com/o/events%2F1685102331681.jpeg?alt=media&token=0619d649-6f58-4aed-8171-32c6bc398e40','https://firebasestorage.googleapis.com/v0/b/guc-guide.appspot.com/o/events%2F1685102063183.jpeg?alt=media&token=8bf2caee-ff98-4599-bcc6-35f2068dc33c', 'https://firebasestorage.googleapis.com/v0/b/guc-guide.appspot.com/o/events%2F1685102281567.jpeg?alt=media&token=280b641b-58ad-4b52-9b45-c31890aeda8b','https://firebasestorage.googleapis.com/v0/b/guc-guide.appspot.com/o/events%2F1685102218575.jpeg?alt=media&token=b5f5cf42-4cb8-4598-831b-8799d4f76653'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
               Container(
                  width: 45,
                  height: 45,
                  margin: EdgeInsets.only(top: 35, left: 40),
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

              Padding(
                padding: EdgeInsets.only(top: 25,left: 20),
                child: Text(
                  'Edit Events',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child:StreamBuilder<List<SpecialEvent>>(
              stream: DatabaseService().events,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(left: Dimensions.width20, bottom: 0),
                      child: Row(
                        children: [
                          //image
                          Container(
                            height: Dimensions.listViewImgSize,
                            width: Dimensions.listViewImgSize,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius20),
                              color: Colors.blue,
                            ),
                            child: Center(child: Image.network(images[index])),
                          ),

                          //text container
                          Expanded(
                            child: Container(
                              height: 109,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(Dimensions.radius20),
                                  bottomRight: Radius.circular(Dimensions.radius20),
                                ),
                                color: Colors.white,
                              ),

                              //
                              child: AppColumn2(event: snapshot.data![index]),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),

    );
  }
}

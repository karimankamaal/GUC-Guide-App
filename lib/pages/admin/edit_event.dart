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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                            child: Center(child: CircularProgressIndicator(color: Colors.red)),
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

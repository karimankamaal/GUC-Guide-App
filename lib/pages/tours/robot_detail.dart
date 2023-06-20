import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RobotDetail extends StatefulWidget {
  const RobotDetail({Key? key}) : super(key: key);

  @override
  State<RobotDetail> createState() => _RobotDetailState();
}

class _RobotDetailState extends State<RobotDetail> {
  String description='';
  String image='';
  List<dynamic> images=[];
  List<dynamic> progress=[];
  List<dynamic> members=[];
  late DateTime date;
  String outputDateString='';

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
    final Object? message = ModalRoute.of(context)?.settings.arguments;
    String robotName= message.toString();
    Future<void> myMethod() async {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('robots')
          .where('name', isEqualTo: robotName)
          .get();

      if (snapshot.docs.isEmpty) {
        throw Exception('No robot found with title $robotName');
      }

      final DocumentSnapshot robotDoc = snapshot.docs.first;
      final String robotId = robotDoc.id;
      final snapshot2 = await FirebaseFirestore.instance.collection('robots').doc(robotId).get();
      final data = snapshot2.data();

      if (data != null) {
        description = data['description'] ?? '';
        members = List<String>.from(data['members'] ?? []);
        images = List<String>.from(data['images'] ?? []);
        image = data['imageURL'] ?? '';
        progress = List<String>.from(data['progress'] ?? []);
        date = data['date']?.toDate() ?? DateTime.now();
        outputDateString = DateFormat('d\'${_getOrdinalSuffix(date.day)}\' MMMM').format(date);
      } else {
        throw Exception('Failed to retrieve robot data');
      }
    }

    myMethod().then((_) {

      setState(() {
        description;
        progress;
        images;
        members;
        date;
        outputDateString;

      });
    });

    @override
    void initState() {
      super.initState();

    }
    return Scaffold(
        body: Stack(
          children: [

            Positioned(
                child: Container(
                  width: 411,
                  child: Image.network(
                    image,
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
                )),
            Positioned(
                child: Container(
                  width: 45,
                  height: 45,
                  margin: EdgeInsets.only(top: 45, left: 30),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Icon(
                          Icons.arrow_back_ios, color: Colors.lightBlue[800]),
                      onPressed: () {
                        Navigator.pushNamed(context, '/mrsdetail');
                      },
                    ),
                  ),
                ),),
            DraggableScrollableSheet(
            initialChildSize: 0.6,
            maxChildSize: 1.0,
            minChildSize: 0.6,
            builder: (context, scrollController) {
                return Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20)),
                ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 5,
                                width: 35,
                                color: Colors.black12,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          robotName ,
                          style: TextStyle(fontFamily: 'roboto',fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Since $outputDateString",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.lightBlue),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Divider(
                            height: 4,
                          ),
                        ),
                        Text(
                          "Description",
                          style: TextStyle(fontSize: 14,fontFamily: 'robotoN')
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                                description,
                              style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.lightBlue),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Divider(
                            height: 4,
                          ),
                        ),
                        Text(
                          "Team Members",
                            style: TextStyle(fontSize: 14,fontFamily: 'robotoN')
                        ),

                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: members.length ,
                            shrinkWrap: true,
                            itemBuilder:  (context, index) {
                              return Row(
                                children: [
                                  Icon(
                                    Icons.done,
                                    size: 15,
                                    color: Colors.lightBlue,
                                  ),
                                  SizedBox(width: 23,),
                                  Text(members[index],style: TextStyle(fontFamily: 'robotoR',fontSize: 12),)
                                ]
                              );
                            }),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Divider(
                            height: 4,
                          ),
                        ),
                        Text(
                          "Progress",
                            style: TextStyle(fontSize: 14,fontFamily: 'robotoN')
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: progress.length,
                            shrinkWrap: true,
                            itemBuilder:  (context, index) {
                              int index2=index+1;
                              return Column(
                                children: [
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Text(index2.toString()),
                                        ),
                                      ),
                                      SizedBox(width: 7,),
                                      Container(width:320,child: Text(progress[index]))
                                    ],
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        width: 320,
                                        height: 200,
                                        child: Image.network(
                                          images[index],
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
                                      ),
                                    ],
                                  ),


                                ],
                              );
                            }),
                      ],
                    ),
                  ),
                );

            })

            
          ],
        ),
    );
  }
}

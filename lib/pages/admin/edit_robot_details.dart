import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditRobotDetail extends StatefulWidget {
  const EditRobotDetail({Key? key}) : super(key: key);

  @override
  State<EditRobotDetail> createState() => _EditRobotDetailState();
}

class _EditRobotDetailState extends State<EditRobotDetail> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  final TextEditingController nameController= TextEditingController();
  final TextEditingController descriptionController= TextEditingController();
  final TextEditingController memberController= TextEditingController();
  final TextEditingController progressController= TextEditingController();
  late ImagePicker _picker;
  File? _image;
  bool loading =false;

  @override
  void initState() {
    _picker = ImagePicker();
    super.initState();
  }
  imgFromGallery() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    _image = File(pickedFile!.path);
    setState(() {
      _image;
    });
    _handleRefresh();
  }
  Future<void> _handleRefresh() async {
    setState(() {
      _image;
    });
  }
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
  Future<void> updateName(String name) async {
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
                    controller: nameController,
                    decoration: InputDecoration(labelText: 'Edit Name'),
                  ),
                ),
                IconButton(onPressed: ()async {
                  Navigator.pop(context);
                  try {
                    final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('robots')
                        .where('name', isEqualTo: name)
                        .get();
                    if (snapshot.docs.isEmpty) {
                      throw Exception('No robot found with title $name');
                    }
                    final DocumentSnapshot robotDoc = snapshot.docs.first;
                    debugPrint("got the document ");
                    final String robotId = robotDoc.id;
                    debugPrint("id of document im trying to change");
                    await FirebaseFirestore.instance.collection('robots').doc(robotId).update(
                        {
                          'name':nameController.text
                        });
                  } catch(e) {
                    throw Exception("Error updating event: $e");
                  }

                }, icon: Icon(Icons.check_circle))
              ],
            ),);
        });
  }
  Future<void> updateDescription(String name) async {
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
                  Navigator.pop(context);
                  try {
                    final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('robots')
                        .where('name', isEqualTo: name)
                        .get();
                    if (snapshot.docs.isEmpty) {
                      throw Exception('No robot found with title $name');
                    }
                    final DocumentSnapshot robotDoc = snapshot.docs.first;
                    debugPrint("got the document ");
                    final String robotId = robotDoc.id;
                    debugPrint("id of document im trying to change");
                    await FirebaseFirestore.instance.collection('robots').doc(robotId).update(
                        {
                          'description':descriptionController.text
                        });
                  } catch(e) {
                    throw Exception("Error updating robot: $e");
                  }

                }, icon: Icon(Icons.check_circle))
              ],
            ),);
        });
  }
  Future<void> updateTime(String name) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (picked != null) {

      try {
        final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('robots')
            .where('name', isEqualTo: name)
            .get();
        if (snapshot.docs.isEmpty) {
          throw Exception('No robot found with title $name');
        }
        final DocumentSnapshot robotDoc = snapshot.docs.first;
        debugPrint("got the document ");
        final String robotId = robotDoc.id;
        debugPrint("id of document im trying to change");
        await FirebaseFirestore.instance.collection('robots').doc(robotId).update(
            {
              'date':picked
            });
      } catch(e) {
        throw Exception("Error updating event: $e");
      }
    }
  }
  Future<void> addMembers(String name) async {
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
                    controller: memberController,
                    decoration: InputDecoration(labelText: 'Add Member'),
                  ),
                ),
                IconButton(onPressed: ()async {
                  Navigator.pop(context);
                  try {
                    final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('robots')
                        .where('name', isEqualTo: name)
                        .get();
                    if (snapshot.docs.isEmpty) {
                      throw Exception('No robot found with title $name');
                    }
                    final DocumentSnapshot robotDoc = snapshot.docs.first;
                    debugPrint("got the document ");
                    final String robotId = robotDoc.id;
                    debugPrint("id of document im trying to change");
                    await FirebaseFirestore.instance.collection('robots').doc(robotId).update(
                        {
                          'members':FieldValue.arrayUnion([memberController.text])
                        });
                  } catch(e) {
                    throw Exception("Error updating event: $e");
                  }

                }, icon: Icon(Icons.check_circle))
              ],
            ),);
        });
  }
  Future<void> deleteMember(String name, int index, List<dynamic> members) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure?'),
          content: Text('Do you really want to delete this member?'),
          actions: <Widget>[
            ElevatedButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('DELETE'),
              onPressed: () async {
                // Perform the delete operation here
                try {
                  final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('robots')
                      .where('name', isEqualTo: name)
                      .get();
                  if (snapshot.docs.isEmpty) {
                    throw Exception('No robot found with title $name');
                  }
                  final DocumentSnapshot robotDoc = snapshot.docs.first;
                  debugPrint("got the document ");
                  final String robotId = robotDoc.id;
                  DocumentReference robotRef = FirebaseFirestore.instance.collection('robots').doc(robotId);
                  debugPrint("id of document im trying to change");
                  // Remove the member that you want to delete from the members array
                  members.remove(members[index]);
                  // Update the members array in the robot document with the new array value
                  robotRef.update({'members': members});
                } catch(e) {
                  throw Exception("Error updating robot: $e");
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

  }
  // Future<void> addProgress(String name, List<dynamic> images) async {
  //   await showModalBottomSheet(
  //       isScrollControlled: true,
  //       context: context,
  //       builder: (BuildContext ctx){
  //         return RefreshIndicator(
  //           onRefresh: () { return _handleRefresh();
  //             },
  //           child: Padding(
  //             padding: EdgeInsets.only(top: 20,left:20,right:20,bottom: MediaQuery.of(ctx).viewInsets.bottom +20),
  //             child:
  //                 Row(
  //                   mainAxisSize: MainAxisSize.min,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Expanded(
  //                       child: TextFormField(
  //                         controller: progressController,
  //                         decoration: InputDecoration(
  //                           labelText: 'Description',
  //                           border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(10.0))),
  //                         ),
  //                       ),
  //                     ),
  //                     Expanded(
  //                         child: _image!=null? Padding(
  //                           padding: const EdgeInsets.only(left:45.0),
  //                           child: Text("Image Attached",style: TextStyle(color: Colors.lightBlue, fontFamily: 'robotoN', decoration: TextDecoration.underline,),),
  //                         ):
  //                         Container(
  //                           width: 70,
  //                           height: 60,
  //                           decoration: BoxDecoration(
  //                             border: Border.all(
  //                               width: 1,
  //                               color: Colors.grey,
  //                             ),
  //                             borderRadius: BorderRadius.circular(10),
  //                           ),
  //                           child: IconButton(
  //                             icon: Icon(Icons.camera_alt),
  //                             iconSize: 30,
  //                             color: Colors.blue, onPressed: () {imgFromGallery();  },
  //                           ),
  //                         )
  //
  //                     ),
  //
  //
  //               Container(
  //                   child: loading? CircularProgressIndicator():IconButton(
  //                     onPressed: ()async {
  //                       Navigator.pop(context);
  //                       try {
  //                         final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('robots')
  //                             .where('name', isEqualTo: name)
  //                             .get();
  //                         if (snapshot.docs.isEmpty) {
  //                           throw Exception('No robot found with title $name');
  //                         }
  //                         final DocumentSnapshot robotDoc = snapshot.docs.first;
  //                         debugPrint("got the document ");
  //                         final String robotId = robotDoc.id;
  //                         debugPrint("id of document im trying to change");
  //                         await FirebaseFirestore.instance.collection('robots').doc(robotId).update(
  //                             {
  //                               'progress':FieldValue.arrayUnion([progressController.text])
  //                             });
  //                       } catch(e) {
  //                         throw Exception("Error updating event: $e");
  //                       }
  //                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //                         content: Text('Milestone added successfully!')));
  //                     },
  //                     icon: IconButton(icon:Icon( Icons.check_circle),
  //                     onPressed:()async{
  //                       if(_image!=null) {
  //                         setState(() {
  //                           loading = true;
  //                         });
  //                         try {
  //                           final Reference storageRef = FirebaseStorage.instance
  //                               .ref().child('events').child('${DateTime
  //                               .now()
  //                               .millisecondsSinceEpoch}.jpeg');
  //                           final UploadTask uploadTask = storageRef.putFile(
  //                               _image!);
  //                           final TaskSnapshot downloadUrl = (await uploadTask
  //                               .whenComplete(() => print('done')));
  //                           String imageURL = await downloadUrl.ref
  //                               .getDownloadURL();
  //                           images.add(imageURL);
  //                           final QuerySnapshot snapshot = await FirebaseFirestore
  //                               .instance.collection('robots')
  //                               .where('name', isEqualTo: name)
  //                               .get();
  //                           if (snapshot.docs.isEmpty) {
  //                             throw Exception('No robot found with title $name');
  //                           }
  //                           final DocumentSnapshot robotDoc = snapshot.docs.first;
  //                           debugPrint("got the document ");
  //                           final String robotId = robotDoc.id;
  //                           await FirebaseFirestore.instance.collection('robots')
  //                               .doc(robotId)
  //                               .update(
  //                               {
  //                                 'images': FieldValue.arrayUnion([imageURL])
  //                               });
  //                         }
  //                       catch(e){
  //           throw Exception("Error updating event: $e");
  //                       }
  //                       if(progressController.text.isNotEmpty){
  //                       setState(() {
  //                       _image=null;
  //                       loading=false;
  //                       });
  //                       }
  //                       loading=false;
  //                     }}),
  //
  //                   ),
  //                 ),
  //               ],
  //             ),),
  //         );
  //       });
  // }
  Future<void> addProgress(String name, List<dynamic> progress) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add a New Milestone'),
          content: Text('Enter the description and image of the milestone'),
          actions: <Widget>[
            IconButton(
                onPressed: () async {
                  await imgFromGallery();
                },
                icon: Icon(Icons.camera_alt)),
            TextField(
              controller: progressController,
              decoration: InputDecoration(labelText: "Description"),
            ),
            ElevatedButton(
                onPressed: () async {
                  setState(() {
                    loading=true;
                  });
                  try {
                    // Find the robot document in Firestore
                    final QuerySnapshot snapshot =
                    await FirebaseFirestore.instance
                        .collection('robots')
                        .where('name', isEqualTo: name)
                        .get();
                    if (snapshot.docs.isEmpty) {
                      throw Exception('No robot found with title $name');
                    }
                    final DocumentSnapshot robotDoc = snapshot.docs.first;
                    final String robotId = robotDoc.id;
                    final DocumentReference robotRef =
                    FirebaseFirestore.instance.collection('robots').doc(robotId);

                    // Upload the image to Firebase Storage and get its download URL
                    final Reference storageRef =
                    FirebaseStorage.instance.ref().child('robots').child('${DateTime.now().millisecondsSinceEpoch}.jpeg');
                    final UploadTask uploadTask = storageRef.putFile(_image!);
                    final TaskSnapshot downloadUrl =
                    await uploadTask.whenComplete(() => print('done'));
                    final String imageURL = await downloadUrl.ref.getDownloadURL();

                    // Add the progress description and image URL to the robot's progress and images arrays
                    progress.add(progressController.text);
                    robotRef.update({'progress': progress});
                    robotRef.update({
                      'images': FieldValue.arrayUnion([imageURL])
                    });
                  } catch (e) {
                    setState(() {
                      loading=false;
                    });
                    throw Exception("Error updating robot: $e");
                  }
                  setState(() {
                    loading=false;
                  });
                  Navigator.of(context).pop();
                },
                child: loading
                ? CircularProgressIndicator() // Show the progress indicator when loading
                : Text("Submit"),)
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    QueryDocumentSnapshot? document=ModalRoute.of(context)?.settings.arguments as QueryDocumentSnapshot<Object?>? ;
   print(document!['name']);
   List<dynamic> progress=document['progress'];
    List<dynamic> members=document['members'];
    List<dynamic> images=document['images'];
    DateTime? dateTime= document['date'].toDate();

    String outputDateString = DateFormat('d\'${_getOrdinalSuffix(dateTime?.day)}\' MMMM y').format(dateTime!);

    return Scaffold(
      body: Stack(
        children: [

          Positioned(
              child: Container(
                width: 411,
                child: Image.asset('lib/assets/blackpanther.png', fit:BoxFit.cover)
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
                    Navigator.pushNamed(context, '/editrobot');
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
                        Row(
                          children: [
                            Text(
                              document['name'] ,
                              style: TextStyle(fontFamily: 'roboto',fontSize: 20),
                            ),
                            IconButton(onPressed: (){updateName(document['name']);}, icon: Icon(Icons.edit))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children:[
                        Text(
                          "Since $outputDateString",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.lightBlue),
                           ),
                            IconButton(onPressed: (){updateTime(document['name']);}, icon: Icon(Icons.edit),iconSize: 20.0,)

                          ]
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
                        Row(
                          children: [
                            Text(
                                "Description",
                                style: TextStyle(fontSize: 14,fontFamily: 'robotoN')
                            ),
                            IconButton(onPressed: (){updateDescription(document['name']);}, icon: Icon(Icons.edit),iconSize: 20.0,)

                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          document['description'],
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
                        Row(
                          children: [
                            Text(
                                "Team Members",
                                style: TextStyle(fontSize: 14,fontFamily: 'robotoN')
                            ),
                            IconButton(onPressed: (){addMembers(document['name']);}, icon: Icon(Icons.add),iconSize: 20.0,)

                          ],
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
                                    Text(members[index],style: TextStyle(fontFamily: 'robotoR',fontSize: 12),),
                                    IconButton(onPressed: (){deleteMember(document['name'], index, members);}, icon: Icon(Icons.delete),iconSize: 20.0,)

                                  ]
                              );
                            }),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Divider(
                            height: 4,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                                "Progress",
                                style: TextStyle(fontSize: 14,fontFamily: 'robotoN')
                            ),
                            IconButton(onPressed: (){addProgress(document['name'], progress);}, icon: Icon(Icons.add),iconSize: 20.0,)

                          ],
                        ),

                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: progress.length,
                            shrinkWrap: true,
                            itemBuilder:  (context, index) {
                              int index2=index+1;
                              return Column(
                                children: [
                                  SizedBox(height: 5),
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
                                      SizedBox(width: 9,),

                                      Container(width:320,child: Text(progress[index])),
                                    ],
                                  ),
                                  SizedBox(height: 9,),
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

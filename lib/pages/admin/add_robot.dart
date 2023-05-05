
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../services/auth.dart';

class AddRobot extends StatefulWidget {
  const AddRobot({Key? key}) : super(key: key);

  @override
  State<AddRobot> createState() => _AddRobotState();
}

class _AddRobotState extends State<AddRobot> {
  File? _image;
  File? _robotImage;
  String imageLink='';
  bool loading =false;
  late ImagePicker _picker;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController= TextEditingController();
  final _memberController= TextEditingController();
  final _progressController= TextEditingController();
  TextEditingController  _dateController= TextEditingController();
  late DateTime _date=DateTime.now();
  List membersList=[];
  List progressList=[];
  List images=[];
  String textFieldText = 'Choose an image';

  @override
  void initState() {
    _picker = ImagePicker();
    super.initState();
  }
  void toggleText() {
    setState(() {
      textFieldText = 'Image attached';
    });
  }

  imgFromGallery() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    _image = File(pickedFile!.path);
    setState(() {
      _image;

    });
  }
  robotImageFromGallery() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    _robotImage = File(pickedFile!.path);
    setState(() {
      _robotImage;

    });
  }
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate:  DateTime(1900),
        lastDate: DateTime(2100));
    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }
  void addProgress() async {
    if(_image!=null){
      setState(() {
        loading = true;
      });

      final Reference storageRef = FirebaseStorage.instance.ref().child('events').child('${DateTime.now().millisecondsSinceEpoch}.jpeg');
      final UploadTask uploadTask = storageRef.putFile(_image!);
      final TaskSnapshot downloadUrl = (await uploadTask
          .whenComplete(() => print('done')));
    String imageURL = await downloadUrl.ref.getDownloadURL();
    images.add(imageURL);
    }
    if(_progressController.text.isNotEmpty){
      setState(() {
        progressList.add(_progressController.text);
        _progressController.clear();
        _image=null;
        loading=false;
      });
    }
    loading=false;
  }
  void addMembers(){
    if (_memberController.text.isNotEmpty) {
      setState(() {
        membersList.add(_memberController.text);
        _memberController.clear();
      });
    }
  }
  final AuthService _auth=AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                  top: 30,
                  left: 20,
                  child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                           Container(
                            width: 45,
                            height: 45,
                            margin: const EdgeInsets.only(right: 140),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: IconButton(
                                icon: Icon(
                                    Icons.arrow_back_ios, color: Colors.lightBlue[800]),
                                onPressed: () {
                                  Navigator.pushNamed(context,'/adminhomepage');
                                },
                              ),
                            ),

                        ),
                        Container(
                            child:
                            const Text(
                              "Robots Form",style: TextStyle(
                                fontWeight: FontWeight.bold,fontSize: 28,fontFamily: 'roboto',color: Colors.lightBlue
                            ),
                            )
                        ),
                      ])
              ),Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                      key: _formKey,
                      child: Container(
                      margin: const EdgeInsets.only(top: 95),
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'Name',
                      border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(20.0)))),
                      validator: (value) {
                      if (value == null || value.isEmpty) {
                      return 'Please enter a name for the robot';
                      }
                      return null;
                      },
                 ),
                        SizedBox(height: 20,),
                        TextFormField(
                          controller: _descriptionController,
                          decoration: const InputDecoration(labelText: 'Description',border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(20.0)))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a description for the robot';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          controller: _memberController,
                          decoration: InputDecoration(
                            labelText: 'Add Members One By One',
                            border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(20.0))),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                addMembers();
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text('Member added successfully!'),
                                ));
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          controller: _dateController,
                          decoration: InputDecoration(
                            labelText: _date==DateTime.now()?'Choose a Start Date From Calender':'Date:${DateFormat('dd/MM/yyyy').format(
                                _date)}',
                            border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(20.0))),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.calendar_month),
                              onPressed: () {
                                selectDate(context);
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Stack(
                          children: [
                            Container(
                              width: 380,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(width: 1, color: Colors.grey),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      enabled: false,
                                      decoration: InputDecoration(
                                        hintText: textFieldText,
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.camera_alt),
                                    onPressed:(){ robotImageFromGallery(); toggleText();},
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        Divider(),
                        SizedBox(height: 10,),
                        Container(
                          child: Text("Enter Milestone Description and Photo", style: TextStyle(fontFamily: 'robotoN', fontSize: 15,color: Colors.lightBlue)),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _progressController,
                                decoration: InputDecoration(
                                  labelText: 'Description',
                                  border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(20.0))),
                                ),
                              ),
                            ),
                            Expanded(
                              child: _image!=null? Padding(
                                padding: const EdgeInsets.only(left:45.0),
                                child: Text("Image Attached",style: TextStyle(color: Colors.lightBlue, fontFamily: 'robotoN', decoration: TextDecoration.underline,),),
                              ):
                              IconButton(onPressed: (){ imgFromGallery() ;},icon: Icon(Icons.camera_alt),)
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Center(
                          child: loading? CircularProgressIndicator():ElevatedButton(
                            onPressed: (){addProgress();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Milestone added successfully!')));
                            },
                            child: Text(
                              "Add Milestone",
                              style: TextStyle(
                                color: Colors.lightBlue, // set text color explicitly
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white, // set button color to white
                              onPrimary: Colors.blue, // set border color to blue
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(color: Colors.blue), // set border color to blue
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 150,),
                        Center(
                          child: ElevatedButton(
                          onPressed : ()async {
                            if (_formKey.currentState!.validate() &&
                                _nameController.text.isNotEmpty &&
                                _descriptionController.text.isNotEmpty ) {
                              // Save form data to variables
                              String name = _nameController.text;
                              String description = _descriptionController.text;
                              _auth.saveToFirebase2(name,description,membersList,progressList,images,_date, _robotImage!);
                              
                              //sendNotification();
                              // Clear text fields
                              _nameController.clear();
                              _descriptionController.clear();
                              progressList=[];
                              membersList=[];
                              images=[];
                              // Show success message
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Robot added successfully!'),
                              ));
                            }
                          },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          child: Text('Submit'),
                      ),
                        )
            ],
          ),
    ))
    ),



            ]
    ),
        ),
      )
    );

  }
}



import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/services.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../../services/auth.dart';

class EventsForm extends StatefulWidget {
  const EventsForm({Key? key}) : super(key: key);

  @override
  _EventsFormState createState() => _EventsFormState();
}

class _EventsFormState extends State<EventsForm> {
  File? _image;
  ImagePicker _picker=ImagePicker();
  final AuthService _auth=AuthService();
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();
  late DateTime _date;
  late TimeOfDay _startTime;

  _imgFromCamera() async {
    XFile? pickedFile = await _picker?.pickImage(source: ImageSource.gallery);
    _image = File(pickedFile!.path);
    setState(() {
      _image;

    });
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime.now(),
        lastDate: DateTime(2100));
    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
      });
    }
  }
  static Timestamp dateTimeToTimestamp(DateTime dateTime){
    return Timestamp.fromMillisecondsSinceEpoch(dateTime.millisecondsSinceEpoch);
  }
  static Timestamp combineDateAndTime(DateTime date, TimeOfDay time){
    final DateTime dateTime=DateTime(date.year,date.month,date.day,time.hour,time.minute);
    return dateTimeToTimestamp(dateTime);
  }
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked =
    await showTimePicker(context: context, initialTime: _startTime);
    if (picked != null && picked != _startTime) {
      setState(() {
        _startTime = picked;
      });
    }
  }
  // Future<void> sendNotification() async {
  //   final response = await http.post(
  //     Uri.parse('https://fcm.googleapis.com/fcm/send'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json',
  //       'Authorization': 'key=<your-server-key>',
  //     },
  //     body: jsonEncode(<String, dynamic>{
  //       'notification': <String, dynamic>{
  //         'title': 'New event created!',
  //         'body': 'Check out the new event in the app.',
  //       },
  //       'data': <String, dynamic>{
  //         'click_action': 'FLUTTER_NOTIFICATION_CLICK',
  //         'event_id': '12345',
  //       },
  //       'to': '/topics/all_users',
  //     }),
  //   );
  // }

  @override
  void initState() {
    super.initState();
    _date = DateTime.now();
    _startTime = TimeOfDay.now();


  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:
            SafeArea(
              child: Stack(
              children:[
                Positioned(
                  top: 20,
                    left: 20,
                            child: Container(
                              width: 45,
                              height: 45,
                              margin: EdgeInsets.only(right: 140),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: IconButton(
                                  icon: Icon(
                                      Icons.arrow_back_ios, color: Colors.lightBlue[800]),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/homepage');
                                  },
                                ),
                              ),

                          ),
                ),
                    Positioned(
                      top:20,
                      left:200,
                      child: Container(
                        child:
                      Text(
                  "Events Form",style: TextStyle(
                  fontWeight: FontWeight.bold,fontSize: 28,fontFamily: 'roboto',color: Colors.lightBlue
                ),
                )
                      ),
                    ),



        SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                      key: _formKey,
                      child: Container(
                        margin: EdgeInsets.only(top: 65),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                controller: _nameController,
                                decoration: InputDecoration(labelText: 'Name'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a name for the event';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16.0),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Date:${DateFormat('dd/MM/yyyy').format(
                                          _date)}',
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () => _selectDate(context),
                                    child: Text('Select date'),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.0),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Starts at: ${_startTime.format(context)}',
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () => _selectTime(context),
                                    child: Text('Select time'),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.0),
                              TextFormField(
                                controller: _descriptionController,
                                decoration: InputDecoration(
                                    labelText: 'Description'),
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a description for the event';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16.0),
                              TextFormField(
                                  controller: _locationController,
                                  decoration: InputDecoration(
                                      labelText: 'Location'),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a location for the event';
                                    }
                                  }
                              ),
                              SizedBox(height: 16.0),
                              Container(
                                margin: const EdgeInsets.only(top: 8),
                                child: _image != null
                                    ? Stack(
                                    children:[
                                      Image.file(
                                          _image!,
                                          width: 335,
                                          height: 300,
                                          fit: BoxFit.fill
                                      ),
                                      Positioned(
                                        top: 410,
                                        left:76,
                                        width:190,
                                        height: 55,
                                        child: ElevatedButton(onPressed: (){
                                          _imgFromCamera();
                                        }, child: Text("Capture another robot!")),
                                      ),

                                    ]
                                )
                                    : InkWell(
                                  onTap: (){
                                    _imgFromCamera();
                                  },
                                      child: Container(
                                  width: 200,
                                  height: 200,
                                  child: const Icon(
                                      Icons.camera_alt,
                                      color: Colors.black,
                                      size: 100,
                                  ),
                                ),
                                    ),
                              ),
                              ElevatedButton(
                                onPressed : ()async {
                                  if (_formKey.currentState!.validate() &&
                                      _nameController.text.isNotEmpty &&
                                      _descriptionController.text.isNotEmpty &&
                                      _locationController.text.isNotEmpty) {
                                    // Save form data to variables
                                    String name = _nameController.text;
                                    DateTime date = _date;
                                    TimeOfDay time = _startTime;
                                    String description = _descriptionController.text;
                                    String location = _locationController.text;

                                    final Timestamp finalTime= combineDateAndTime(date, time);
                                    // Do something with the data, e.g. print them to console
                                    _auth.saveToFirebase(finalTime, name, description, location,_image!);
                                    //sendNotification();
                                    // Clear text fields
                                    _nameController.clear();
                                    _descriptionController.clear();
                                    _locationController.clear();
                                    setState(() {
                                      _image=null;
                                    });


                                    // Show success message
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text('Event created successfully!'),
                                    ));
                                  }
                                },
                                child: Text('Submit'),
                              )


                            ]
                        ),
                      )
                  )
              )
        )

    ]
    ),
            )
    );
  }
}

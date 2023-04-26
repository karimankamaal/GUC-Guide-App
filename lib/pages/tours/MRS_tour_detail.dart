import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';




class MRSDetail extends StatefulWidget {
  const MRSDetail({Key? key}) : super(key: key);

  @override
  State<MRSDetail> createState() => _MRSDetailState();
}

class _MRSDetailState extends State<MRSDetail> {
  String text="";
  File? _image;
  String result = '';
  String description='';
  late ImagePicker _picker;
  dynamic imageLabeler;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _picker = ImagePicker();
    //TODO initialize labeler
    createLabeler();
  }

  @override
  void dispose() {
    super.dispose();
    imageLabeler.close();
  }

  _imgFromCamera() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    _image = File(pickedFile!.path);
    setState(() {
      _image;
      text;
    });
    await createLabeler();
    await doImageLabeling();
  }

  createLabeler() async {
    final modelPath = await _getModel('lib/assets/ml/model.tflite');
    final options = LocalLabelerOptions(modelPath: modelPath);
    imageLabeler = ImageLabeler(options: options);
  }

  Future<String> _getModel(String assetPath) async {
    if (Platform.isAndroid) {
      return 'flutter_assets/$assetPath';
    }
    final path = '${(await getApplicationSupportDirectory()).path}/$assetPath';
    await Directory(dirname(path)).create(recursive: true);
    final file = File(path);
    if (!await file.exists()) {
      final byteData = await rootBundle.load(assetPath);
      await file.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    }
    return file.path;
  }

  doImageLabeling() async {
    result = "";
    description="";


    final inputImage = InputImage.fromFile(_image!);
    final List<ImageLabel> labels = await imageLabeler.processImage(inputImage);
    for (ImageLabel label in labels) {
       text = label.label;
       print("yarab"+ text);
       setState(() {
         text;
       });
      final int index = label.index;
      final double confidence = label.confidence;
      result += "$text   ${confidence.toStringAsFixed(2)}\n";
    }

    setState(() {
      result = result;
      description= description;
      text= text;
    });
  }

  @override
  Widget build(BuildContext context) {

    void redirect(){
      Navigator.pushNamed(context, '/robotdetail', arguments: text,);
    }
    print("jiiiii"+description);
    return Scaffold(
        body: Stack(
          children: [
            Container(
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
                    Navigator.pushNamed(context, '/mrstour');
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 45, left: 310),
              child: Column(
                children: [
                  Text("MRS", style: TextStyle(fontSize: 25,
                      fontFamily: 'misto',
                      color: Colors.lightBlue[800]),),
                  Text("Lab", style: TextStyle(fontSize: 25,
                      fontFamily: 'misto',
                      color: Colors.lightBlue[800]),),
                  Text("Tour", style: TextStyle(fontSize: 25,
                      fontFamily: 'misto',
                      color: Colors.lightBlue[800]),),

                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 100),
              child: Stack(children: <Widget>[

                Padding(
                  padding: EdgeInsets.only(top:50,left:20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        shadowColor: Colors.transparent),

                    onPressed:() async {  await _imgFromCamera(); text=='' ? CircularProgressIndicator(): redirect();},
                    child:
                    Container(
                      width: 340,
                      height: 330,
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.black,
                        size: 100,
                      ),
                    ),
                  ),
                ),
              ]),
            ),


          ],
        )

    );

  }
}
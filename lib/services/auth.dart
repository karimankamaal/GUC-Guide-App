import 'dart:convert';

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:myfirstapp/models/user.dart';
import 'dart:typed_data';
class AuthService{
  final FirebaseAuth _auth= FirebaseAuth.instance;

MyUser? _userFromFirebase(User user){
  return user!=null? MyUser(uid: user.uid):null;
}
  Stream<MyUser?> get user {
    return _auth.authStateChanges()
        .map((User? user) => _userFromFirebase(user!));
  }

  Future signInWithEmailAndPassword(String email,String password)async{
  try{
    UserCredential result= await _auth.signInWithEmailAndPassword(email: email, password: password);
    User? user=result.user;
    return _userFromFirebase(user!);
  }catch(e){
    print(e.toString());
    return null;
  }
  }


  Future<void> saveToFirebase(Timestamp date, String name, String description, String location, File image) async {
    try {
      // Upload image to Firebase Storage
      final Reference storageRef = FirebaseStorage.instance.ref().child('events').child('${DateTime.now().millisecondsSinceEpoch}.jpeg');
      final UploadTask uploadTask = storageRef.putFile(image);
      final TaskSnapshot downloadUrl = (await uploadTask
          .whenComplete(() => print('done')));
      String imageURL = await downloadUrl.ref.getDownloadURL();


      // Save fields including image URL to Firestore
      await FirebaseFirestore.instance.collection('events').add({
        'title': name,
        'description': description,
        'date': date,
        'location': location,
        'imageURL': imageURL,
      });
      await updateTitleLowercaseField();
      print('Event added successfully to Firestore!');
    } catch (e) {
      print('Error adding event to Firestore: $e');
    }
  }
  Future<void> saveToFirebase2( String name,  String description,List members, List progress,List images, DateTime date) async {
    try {
      // Save fields including image URL to Firestore
      await FirebaseFirestore.instance.collection('robots').add({
        'name': name,
        'description': description,
        'members': members,
        'images': images,
        'progress': progress,
        'date': date
      });

      print('Robot added successfully to Firestore!');
    } catch (e) {
      print('Error adding robot to Firestore: $e');
    }
  }

  // Update existing documents to include the 'title_lowercase' field
  Future<void> updateTitleLowercaseField() async {
    final result = await FirebaseFirestore.instance.collection('events').get();
    final batch = FirebaseFirestore.instance.batch();
    result.docs.forEach((doc) {
      final data = doc.data();
      final title = data['title'];
      batch.update(doc.reference, {
        'title_lowercase': title.toLowerCase(),
      });
    });
    await batch.commit();
  }

   Future<List<QueryDocumentSnapshot>> getCollection(String collectionPath) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection(collectionPath).get();
    List<QueryDocumentSnapshot> documents = snapshot.docs;
    return documents;
  }


}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myfirstapp/models/specialevents_model.dart';

class DatabaseService{
  final CollectionReference eventsCollection=FirebaseFirestore.instance.collection('events');


  List<SpecialEvent> _eventsListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return SpecialEvent(
          title: doc.get('title') ?? '',
          location: doc.get('location') ?? 'no place',
        description: doc.get('description') ?? 0,
        date: doc.get('date'),

      );
    }).toList();
  }
  Stream< List<SpecialEvent>> get events{
    return eventsCollection.snapshots()
        .map(_eventsListFromSnapshot);
  }
}
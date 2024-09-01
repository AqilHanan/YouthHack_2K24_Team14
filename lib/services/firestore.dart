import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //get collection of givers
  final CollectionReference givers =
      FirebaseFirestore.instance.collection('givers');

  //create: add new giver details
  Future<void> addGiver(
      String type,
      String name,
      String dietType,
      bool cooked,
      DateTime expdate
      ) {
    return givers.add({
      'type': type,
      'name': name,
      'diet-type': dietType,
      'cooked': cooked,
      'expdate': expdate,
      'timestamp': Timestamp.now()
    });
  }

  //read: get giver from database

  //update: update giver given doc id

  //delete: delete giver given doc id
}
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //get collection of givers
  final CollectionReference givers =
  FirebaseFirestore.instance.collection('givers');
  final CollectionReference takers =
  FirebaseFirestore.instance.collection('takers');
  final CollectionReference deliverers =
  FirebaseFirestore.instance.collection('deliverers');
  final CollectionReference deliveries =
  FirebaseFirestore.instance.collection('deliveries');

  //create: add new giver details
  Future<void> addGiver(String type,
      String name,
      String dietType,
      bool cooked,
      DateTime expdate) {
    return givers.add({
      'type': type,
      'name': name,
      'diet-type': dietType,
      'cooked': cooked,
      'expdate': expdate,
      'timestamp': Timestamp.now(),
    });
  }

//takers
  Future<void> addTaker(String nameTaker,
      String planType,
      int familyPax,
      int houseIncome,
      String dietReq,) {
    return takers.add({
      'nameTaker': nameTaker,
      'planType': planType,
      'familyPax': familyPax,
      'houseIncome': houseIncome,
      'dietReq': dietReq,
      'timestamp': Timestamp.now(),
    });
  }

  //signed up deliverers
  Future<void> addDeliverer(String nameDeliverer,
      String role,
      //String order,
      ) {
    return deliverers.add({
      'nameDeliverer': nameDeliverer,
      'role': role,
      //'order': order,
      'timestamp': Timestamp.now(),
    });
  }

  //deliveries who picked up what order
  Future<void> addDelivery(String nameAndRole,
      String orderSummary,) {
    return deliverers.add({
      'nameAndRole': nameAndRole,
      'orderSummary': orderSummary,
    });
  }

//read: get giver from database

//update: update giver given doc id

//delete: delete giver given doc id
}
//end
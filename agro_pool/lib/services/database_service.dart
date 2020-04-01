
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference usersCollection = Firestore.instance.collection('Users');

  Future updateUserData(userData) async{
    return await usersCollection.document(uid).setData(userData);
  }


}
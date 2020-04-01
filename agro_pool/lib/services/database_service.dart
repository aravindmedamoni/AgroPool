
import 'package:agro_pool/model/users_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference usersCollection = Firestore.instance.collection('Users');

  //Add or update the user data in the firestore with specified user id
  Future updateUserData(userData) async{
    return await usersCollection.document(uid).setData(userData);
  }

  //Getting the custom user data from the firebase QuerySnopshot
  List<UsersData> _customUsersListFromQuerySnapShot(QuerySnapshot snapshot){
    return snapshot.documents.map((document){
      UsersData(
        email: document.data['email'] ?? 'null',
        district: document.data['district'] ?? 'null',
        name: document.data['name'] ?? 'null',
        mobileNumber: document.data['mobileNumber'] ?? 'null',
          rgstrOrCropName: document.data['rgstrOrCropName'] ?? 'null'
      );
    }).toList();
  }
  //getting the all the user data
    Stream<List<UsersData>> get allUsers{
    return usersCollection.snapshots().map(_customUsersListFromQuerySnapShot);
    }

    //Getting the custom user Data from Firestore Document snapshot
  UsersData _customUserDataFromDocSnapshot(DocumentSnapshot snapshot){
    return  UsersData(
      rgstrOrCropName: snapshot.data['rgstrOrCropName'] ?? 'null',
      mobileNumber: snapshot.data['mobileNumber'] ?? 'null',
      name: snapshot.data['name'] ?? 'null',
      district: snapshot.data['district'] ?? 'null',
      email: snapshot.data['email'] ?? 'null',
      state: snapshot.data['state'] ?? 'null',
      uid: uid
    );
  }

    //Getting the particular user's Data with his uid
    Stream<UsersData> get userData{
    return usersCollection.document(uid).snapshots().map(_customUserDataFromDocSnapshot);
    }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseMethods {
  Future<void> addUserInfo(userData) async {
    FirebaseFirestore.instance.collection("users").add(userData).catchError((e) {
      print(e.toString());
    });
  }

  getUserInfo(String email) async {
    return FirebaseFirestore.instance
    .collection("users")
    .where("userEmail",isEqualTo: email)
    .get()
    .catchError((e){
      print(e);
    });
  }

  searchByName(String searchField) {
    return FirebaseFirestore.instance
    .collection("users")
    .where('userName', isEqualTo: searchField)
    .get();
  }

  Future<void> addChatRoom(chatRoom, chatRoomId) async{
    await FirebaseFirestore.instance
    .collection("chatRoom")
    .doc(chatRoomId)
    .set(chatRoom)
    // .document(chatRoomId)
    // .setData(chatRoom)
    .catchError((e) {
      print(e);
    });
  }

  getChats(String chatRoomId) async{
    return FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .orderBy('time')
        .snapshots();
  }


  Future<void> addMessage(String chatRoomId, chatMessageData)async {
    await FirebaseFirestore.instance.collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .add(chatMessageData).catchError((e){
          print(e.toString());
    }); 
  }



  getUserChats(String itIsMyName) async {
    return await FirebaseFirestore.instance
        .collection("chatRoom")
        .where('users', arrayContains: itIsMyName)
        .snapshots();
  }

}
// replace Firestore.instance from FirebaseFirebaseFirestore.instance
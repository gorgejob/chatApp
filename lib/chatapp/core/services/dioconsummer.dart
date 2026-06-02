import 'dart:developer';

import 'package:chrush/app/auth/domin/entitiy/user_entitiey.dart';
import 'package:chrush/chatapp/chat/data/data_sourse/chat_local.dart';
import 'package:chrush/chatapp/chat/data/model/chatroom.dart';
import 'package:chrush/chatapp/chat/data/model/message_model.dart';
import 'package:chrush/chatapp/chat/data/model/user_model.dart';
import 'package:chrush/chatapp/core/services/apiconsumer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class Dioconsummer extends Apiconsumer {
  String generateChatRoomId(String user1, String user2) {
    List<String> ids = [user1, user2];
    ids.sort();
    return ids.join('_');
  }

  // to help function send message
  @override
  Future createChatRoom(Chatroom chatroom) async {
    await FirebaseFirestore.instance
        .collection("chats")
        .doc(chatroom.chatRoomId)
        .set(chatroom.tojson(), SetOptions(merge: true));
  }

  // to send message any person
  @override
  Future sendMessage(MessageModel message, UserModel receverid) async {
    try {
      final String chatid = generateChatRoomId(
        message.senderid,
        message.receverid,
      );
      final userdata = await ChatLocal().getUser();

      await createChatRoom(
        Chatroom(
          chatRoomId: chatid,
          participants: [userdata, receverid],
          participantsid: [userdata.id, receverid.id],
          lastMessage: message.text,
          lastMessageSenderId: message.senderid,
          lastMessageTimestamp: message.timestamp,
        ),
      );
      await FirebaseFirestore.instance
          .collection("chats")
          .doc(chatid)
          .collection("messages")
          .add(message.tojson());
    } on Exception catch (e) {
      log("لا يوجد انترنت $e");
    }
  }

  // add user in firebasefirestore
  @override
  Future addUsers(UserEntitiey data) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: data.email,
        password: data.password,
      );
      final id = FirebaseAuth.instance.currentUser;

      await ChatLocal().saveUser(
        UserModel(
          id: id!.uid,
          name: data.name,
          email: data.email,
          number: data.number,
          password: data.password,
        ),
      );
      await FirebaseFirestore.instance
          .collection("users")
          .doc(id.uid)
          .set(
            UserModel(
              id: id.uid,
              name: data.name,
              email: data.email,
              number: data.number,
              password: data.password,
            ).toJson(),
          );
    } on Exception catch (e) {
      log("لا يوجد انترنت $e");
    }
  }

  // get users if found in contacts
  @override
  Future<List<UserModel>> getUsers() async {
    // 1. جلب البيانات من الفايربيس
    try {
      final res = await FirebaseFirestore.instance.collection("users").get();
      final List<UserModel> data =
          res.docs.map((e) => UserModel.fromjson(e.data())).toList();

      List<UserModel> commonUsers = [];
      final status = await FlutterContacts.requestPermission();
      if (status == true) {
        List<Contact> contacts = await FlutterContacts.getContacts(
          withProperties: true,
          withThumbnail: true,
        );
        final Set<String> phoneNumbersSet =
            contacts
                .expand(
                  (contact) => contact.phones,
                ) // بيفرد كل لست أرقام التليفونات
                .map(
                  (phone) => phone.number.replaceAll(RegExp(r'\s+'), ''),
                ) // بيشيل المسافات
                .toSet();
        commonUsers =
            data.where((user) {
              String cleanUserPhone = user.number.replaceAll(
                RegExp(r'\s+'),
                '',
              );
              return phoneNumbersSet.contains(cleanUserPhone);
            }).toList();
        print("عدد المستخدمين المشتركين: ${commonUsers[0].number}");
        print("عدد المستخدمين المشتركين: ${commonUsers[0].name}");
      }
      return commonUsers;
    } on Exception catch (e) {
      log("لا يوجد انترنت $e");
      return [];
    }
  }

  @override
  Future signin(String email, password) async {
    try {
      final data = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final id = data.user!.uid;
      final user =
          await FirebaseFirestore.instance
              .collection("users")
              .where("id", isEqualTo: id)
              .get();
      final UserModel userm = UserModel.fromjson(user.docs.first.data());
      await ChatLocal().saveUser(userm);
    } on Exception catch (e) {
      log("لا يوجد انترنت");
    }
  }

  @override
  Future<Stream<List<MessageModel>>> getmessages(receverid) async {
    try {
      final senderid = await ChatLocal().getUser();
      final chatid = generateChatRoomId(senderid.id, receverid);
      final data = FirebaseFirestore.instance
          .collection("chats")
          .doc(chatid)
          .collection("messages")
          .orderBy("timestamp", descending: false)
          .snapshots()
          .map(
            (event) =>
                event.docs.map((e) => MessageModel.fromjson(e.data())).toList(),
          );
      return data;
    } catch (e) {
      log("لا يوجد انترنت $e");
      return Stream.empty();
    }
  }

  @override
  Future<Stream<List<Chatroom>>> getchatsroom() async {
    try {
      final userid = await ChatLocal().getUser();
      return FirebaseFirestore.instance
          .collection("chats")
          .where("participantsid", arrayContains: userid.id)
          .snapshots()
          .map(
            (event) =>
                event.docs.map((e) => Chatroom.fromjson(e.data())).toList(),
          );
    } on Exception catch (e) {
      return Stream.empty();
    }
  }

  @override
  Future seenMessage(String chatid, receverid) async {
    try {
      await FirebaseFirestore.instance
          .collection('chats')
          .doc(chatid)
          .collection('messages')
          .where('senderid', isEqualTo: receverid)
          .where('isSeen', isEqualTo: false)
          .get()
          .then((snapshot) {
            print("عدد الرسائل غير المقروءة المكتشفة: ${snapshot.docs.length}");
            for (var doc in snapshot.docs) {
              doc.reference.update({'isSeen': true});
            }
          })
          .catchError((error) {
            print("حصلت مشكلة أثناء التحديث: $error");
          });
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}

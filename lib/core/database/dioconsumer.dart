import 'dart:developer';

import 'package:chrush/app/auth/domin/entitiy/user_entitiey.dart';
import 'package:chrush/app/auth/domin/entitiy/user_sign_in.dart';
import 'package:chrush/app/home/data/models/books_model.dart';
import 'package:chrush/core/database/apiconsumer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

///this is code test
class DioConsummer extends Apiconsumer {
  final Dio dio;

  DioConsummer({required this.dio});

  @override
  Future addUser(UserEntitiey data) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: data.email,
        password: data.password,
      );
      final id = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection("users")
          .doc(id!.uid)
          .set(data.tojson());
    } on Exception catch (e) {
      log("gorgegrggfcgdgfdfgdfgd $e");
    }
  }

  @override
  Future checkuser(UserSignIn data) async {
    try {
      final gorge = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: data.email,
        password: data.password,
      );
      DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");

      final res = await ref.get();
      log(res.value.toString());
      log(gorge.toString());
    } on Exception catch (e) {
      log("gorgegrggfcgdgfdfgdfgd  $e");
    }
  }

  @override
  Future addBook(BooksModel data) async {
    final creduial = CloudinaryPublic('dlohpq3mh', 'flutter_preset');
    final CloudinaryResponse response = await creduial.uploadFile(
      CloudinaryFile.fromFile(
        data.imagepath,
        resourceType: CloudinaryResourceType.Image,
      ),
    );
    final id = FirebaseAuth.instance.currentUser;

    await FirebaseFirestore.instance
        .collection("products")
        .doc("books")
        .collection("booksout")
        .doc(id!.uid)
        .set({
          "id": id.uid,
          "imagepath": response.secureUrl,
          "title": data.name,
          "descrapation": data.descapation,
          "price": data.price,
          "count": data.count,
          "last time": data.lasttime,
        });
  }

  @override
  Future deleteBook(id) async {}

  @override
  Future editBook(id) async {}

  @override
  Stream<List<BooksModel>> getBooks() {
    final response = FirebaseFirestore.instance
        .collection("products")
        .doc("books")
        .collection("booksout")
        .snapshots()
        .map(
          (event) =>
              event.docs.map((e) => BooksModel.fromjson(e.data())).toList(),
        );

    return response;
  }
}

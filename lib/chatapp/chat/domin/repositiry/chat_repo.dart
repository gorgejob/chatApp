import 'package:chrush/app/auth/domin/entitiy/user_entitiey.dart';
import 'package:chrush/chatapp/chat/data/model/chatroom.dart';
import 'package:chrush/chatapp/chat/data/model/message_model.dart';
import 'package:chrush/chatapp/chat/data/model/user_model.dart';

abstract class ChatRepo {
  Future addmessage(MessageModel message, UserModel receverid);
  Future<dynamic> addUsers(UserEntitiey data);
  Future<List<UserModel>> getUsers();
  Future<dynamic> signin(String email, dynamic password);
  Future<Stream<List<MessageModel>>> getmessages(dynamic receverid);
  Future<Stream<List<Chatroom>>> getchatroom();
  Future<dynamic> seenMessage(String chatid, dynamic receverid);
}

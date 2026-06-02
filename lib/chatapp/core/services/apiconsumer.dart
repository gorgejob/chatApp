import 'package:chrush/app/auth/domin/entitiy/user_entitiey.dart';
import 'package:chrush/chatapp/chat/data/model/chatroom.dart';
import 'package:chrush/chatapp/chat/data/model/message_model.dart';
import 'package:chrush/chatapp/chat/data/model/user_model.dart';

abstract class Apiconsumer {
  Future sendMessage(MessageModel message, UserModel receverid);
  Future createChatRoom(Chatroom chatroom);
  Future<dynamic> addUsers(UserEntitiey data);
  Future<dynamic> getUsers();
  Future signin(String email, password);
  Future<Stream<List<MessageModel>>> getmessages(receverid);
  Future<Stream<List<Chatroom>>> getchatsroom();
  Future seenMessage(String chatid, receverid);
}

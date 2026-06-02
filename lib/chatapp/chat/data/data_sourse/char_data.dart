import 'package:chrush/app/auth/domin/entitiy/user_entitiey.dart';
import 'package:chrush/chatapp/chat/data/model/chatroom.dart';
import 'package:chrush/chatapp/chat/data/model/message_model.dart';
import 'package:chrush/chatapp/chat/data/model/user_model.dart';
import 'package:chrush/chatapp/core/services/apiconsumer.dart';

class CharData {
  final Apiconsumer apiconsumer;

  CharData({required this.apiconsumer});

  Future addmessage(MessageModel message, UserModel receverid) async {
    await apiconsumer.sendMessage(message, receverid);
  }

  Future addUser(UserEntitiey user) async {
    await apiconsumer.addUsers(user);
  }

  Future<List<UserModel>> getUser() async {
    return await apiconsumer.getUsers();
  }

  Future signin(String email, password) async {
    return await apiconsumer.signin(email, password);
  }
  Future<Stream<List<MessageModel>>> getmessages(dynamic receverid)async{
    return await apiconsumer.getmessages(receverid);  
  }
  Future<Stream<List<Chatroom>>> getchatroom()async{
    return await apiconsumer.getchatsroom();  
  }
  Future<dynamic> seenMessage(String chatid, dynamic receverid)async{
     await apiconsumer.seenMessage(chatid, receverid);  

  }
}

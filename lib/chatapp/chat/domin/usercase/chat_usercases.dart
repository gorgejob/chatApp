import 'package:chrush/app/auth/domin/entitiy/user_entitiey.dart';
import 'package:chrush/chatapp/chat/data/model/chatroom.dart';
import 'package:chrush/chatapp/chat/data/model/message_model.dart';
import 'package:chrush/chatapp/chat/data/model/user_model.dart';
import 'package:chrush/chatapp/chat/data/repositiery/chat_repo_impl.dart';

class ChatUsercases {
  final ChatRepoImpl chatRepo;

  ChatUsercases({required this.chatRepo});
  Future call(MessageModel message, UserModel receverid) async {
    await chatRepo.addmessage(message, receverid);
  }

  Future calladd(UserEntitiey user) async {
    await chatRepo.addUsers(user);
  }

  Future<List<UserModel>> callget() async {
    return await chatRepo.getUsers();
  }

  Future callsign(String email, password) async {
    return await chatRepo.signin(email, password);
  }

  Future<Stream<List<MessageModel>>> callgetmessage(String receverid) async {
    return await chatRepo.getmessages(receverid);
  }

  Future<Stream<List<Chatroom>>> callgetAllChatsroom() async {
    return await chatRepo.getchatroom();
  }

  Future callseenMessage(
    String chatid,
    dynamic receverid,
  ) async {
     await chatRepo.seenMessage(chatid, receverid);
  }
}

import 'package:chrush/app/auth/domin/entitiy/user_entitiey.dart';
import 'package:chrush/chatapp/chat/data/data_sourse/char_data.dart';
import 'package:chrush/chatapp/chat/data/model/chatroom.dart';
import 'package:chrush/chatapp/chat/data/model/message_model.dart';
import 'package:chrush/chatapp/chat/data/model/user_model.dart';
import 'package:chrush/chatapp/chat/domin/repositiry/chat_repo.dart';

class ChatRepoImpl implements ChatRepo {
  final CharData charData;

  ChatRepoImpl({required this.charData});
  @override
  Future addmessage(MessageModel message, UserModel receverid) async {
    await charData.addmessage(message, receverid);
  }

  @override
  Future addUsers(UserEntitiey data) async {
    await charData.addUser(data);
  }

  @override
  Future<List<UserModel>> getUsers() async {
    return await charData.getUser();
  }

  @override
  Future signin(String email, password) async {
    await charData.signin(email, password);
  }
  
  @override
  Future<Stream<List<MessageModel>>> getmessages(receverid)async {
    return await charData.getmessages(receverid); 
  }

  @override
  Future<Stream<List<Chatroom>>> getchatroom() async{
    return await charData.getchatroom(); 

  }
  
  @override
  Future seenMessage(String chatid, receverid) async{
     await charData.seenMessage(chatid, receverid); 

  }
  
}

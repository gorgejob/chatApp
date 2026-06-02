import 'package:chrush/chatapp/chat/data/model/chatroom.dart';
import 'package:chrush/chatapp/chat/data/model/message_model.dart';
import 'package:chrush/chatapp/chat/data/model/user_model.dart';


abstract class Chatstate {}

class Init extends Chatstate {}

class Succes extends Chatstate {
  final List<UserModel> data;
  final String myUid;

  Succes({required this.data, required this.myUid});

}

class Loading extends Chatstate {}

class Succesgetmesage extends Chatstate {
  final String myUid;
  final List<MessageModel> data;

  Succesgetmesage({required this.myUid, required this.data});

}

class SuccesgetchatRoom extends Chatstate {
  final List<Chatroom> data;
  final String myUid;

  SuccesgetchatRoom({required this.data, required this.myUid });

}

import 'package:chrush/chatapp/chat/data/model/user_model.dart';

class Chatroom {
  final String chatRoomId;
  final List<UserModel> participants;
  final List<String> participantsid;
  final String lastMessage;
  final String lastMessageSenderId;
  final String lastMessageTimestamp;

  Chatroom({
    required this.chatRoomId,
    required this.participants,
    required this.participantsid,
    required this.lastMessage,
    required this.lastMessageSenderId,
    required this.lastMessageTimestamp,
  });

  factory Chatroom.fromjson(Map<String, dynamic> json) {
    return Chatroom(
      chatRoomId: json["chatRoomId"],
      participants:
          (json["participants"] as List<dynamic>?)
              ?.map((e) => UserModel.fromjson((e as Map<String, dynamic>)))
              .toList() ??
          [],
      participantsid:
          (json['participantsid'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      lastMessage: json["lastMessage"],
      lastMessageSenderId: json["lastMessageSenderId"],
      lastMessageTimestamp: json["lastMessageTimestamp"],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      "chatRoomId": chatRoomId,
      "participants": participants.map((user) => user.toJson()).toList(),
      "participantsid": participantsid.toList(),
      "lastMessage": lastMessage,
      "lastMessageSenderId": lastMessageSenderId,
      "lastMessageTimestamp": lastMessageTimestamp,
    };
  }
}

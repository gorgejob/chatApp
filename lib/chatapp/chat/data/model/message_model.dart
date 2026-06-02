class MessageModel {
  final String messageid;
  final String senderid;
  final String receverid;
  final String text;
  final String timestamp;
  final bool isSeen ;

  MessageModel({
    required this.messageid,
    required this.senderid,
    required this.receverid,
    required this.text,
    required this.timestamp,
    this.isSeen = false,
  });
  factory MessageModel.fromjson(Map<String, dynamic> json) {
    return MessageModel(
      messageid: json["messageid"],
      senderid: json["senderid"],
      receverid: json["receverid"],
      text: json["text"],
      timestamp: json["timestamp"],
      isSeen: json["isSeen"] ?? false,
    );
  }

  tojson() {
    return {
      "messageid": messageid,
      "senderid": senderid,
      "receverid": receverid,
      "text": text,
      "timestamp": timestamp,
      "isSeen": isSeen,
    };
  }
}

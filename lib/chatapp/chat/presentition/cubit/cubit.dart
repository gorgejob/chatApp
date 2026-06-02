import "../../../../paths.dart";

class Chatbloc extends Cubit<Chatstate> {
  Chatbloc() : super(Init());

  StreamSubscription? _chatsrooms;
  StreamSubscription? _messages;
  navigatortopage(BuildContext context, Widget widget) async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  addmessage(String text, UserModel receverid) async {
    final messageid = randomAlpha(10);
    final senderid = FirebaseAuth.instance.currentUser!.uid;
    await ChatUsercases(
      chatRepo: ChatRepoImpl(charData: CharData(apiconsumer: Dioconsummer())),
    ).call(
      MessageModel(
        messageid: messageid,
        senderid: senderid,
        receverid: receverid.id,
        text: text,
        timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
      ),
      receverid,
    );
  }

  addUser(UserEntitiey user) async {
    await ChatUsercases(
      chatRepo: ChatRepoImpl(charData: CharData(apiconsumer: Dioconsummer())),
    ).calladd(user);
  }

  Future getUser() async {
    emit(Loading());
    final myUid = await getuserid();
    final data =
        await ChatUsercases(
          chatRepo: ChatRepoImpl(
            charData: CharData(apiconsumer: Dioconsummer()),
          ),
        ).callget();
    emit(Succes(data: data, myUid: myUid.id));
  }

  Future signin(String email, password, BuildContext context) async {
    await ChatUsercases(
      chatRepo: ChatRepoImpl(charData: CharData(apiconsumer: Dioconsummer())),
    ).callsign(email, password);
    navigatortopage(context, const Chatroom());
  }

  Future getmessage(String receverid) async {
    final myUid = await getuserid();
    emit(Loading());
    final data = await ChatUsercases(
      chatRepo: ChatRepoImpl(charData: CharData(apiconsumer: Dioconsummer())),
    ).callgetmessage(receverid);
    _messages = data.listen(
      (event) => emit(Succesgetmesage(data: event, myUid: myUid.id)),
    );
  }

  Future<UserModel> getuserid() async {
    final data = await ChatLocal().getUser();
    return data;
  }

  Future getChatroom() async {
    emit(Loading());
    final myUid = await getuserid();
    final data =
        await ChatUsercases(
          chatRepo: ChatRepoImpl(
            charData: CharData(apiconsumer: Dioconsummer()),
          ),
        ).callgetAllChatsroom();

    _chatsrooms = data.listen(
      (event) => emit(SuccesgetchatRoom(data: event, myUid: myUid.id)),
    );
  }

  Future seenMessage({
    required String chatid,
    required dynamic receverid,
  }) async {
    await ChatUsercases(
      chatRepo: ChatRepoImpl(charData: CharData(apiconsumer: Dioconsummer())),
    ).callseenMessage(chatid, receverid);
  }

  Future closemessages() async {
    await _messages?.cancel();
  }

  Future closechatrooms() async {
    await _chatsrooms?.cancel();
  }
}

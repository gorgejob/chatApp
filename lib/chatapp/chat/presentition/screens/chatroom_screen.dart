import "../../../../paths.dart";

class ChatroomScreen extends StatefulWidget {
  const ChatroomScreen({
    super.key,
    required this.receverid,
    required this.chatid,
  });
  final String chatid;
  final UserModel receverid;

  @override
  State<ChatroomScreen> createState() => _ChatroomScreenState();
}

class _ChatroomScreenState extends State<ChatroomScreen> {
  @override
  void initState() {
    context.read<Chatbloc>().getmessage(widget.receverid.id);
    context.read<Chatbloc>().seenMessage(
      chatid: widget.chatid,
      receverid: widget.receverid.id,
    );

    super.initState();
  }

  final ScrollController _scrollController = ScrollController();

  // ميثود بتخلي اللستة تنزل لآخر سطر تحت
  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        context.read<Chatbloc>().closemessages();
        context.read<Chatbloc>().navigatortopage(context, const Chatroom());
      },
      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: WhatsAppbar(image: "", name: widget.receverid.name),
        ),

        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocConsumer<Chatbloc, Chatstate>(
                listener: (context, state) {
                  WidgetsBinding.instance.addPostFrameCallback(
                    (_) => _scrollToBottom(),
                  );
                },
                builder: (context, state) {
                  if (state is Loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is Succesgetmesage) {
                    final data = state.data;

                    return Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final item = data[index];
                          final bool isMe = item.senderid == state.myUid;
                          return WhatsContainerBody(
                            isMe: isMe,
                            text: item.text,
                            isSeen: item.isSeen,
                          );
                        },
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              WhatsTextfieldSend(receverid: widget.receverid),
            ],
          ),
        ),
      ),
    );
  }
}

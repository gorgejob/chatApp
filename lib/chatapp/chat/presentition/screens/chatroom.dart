import "../../../../paths.dart";

class Chatroom extends StatefulWidget {
  const Chatroom({super.key});

  @override
  State<Chatroom> createState() => _ChatroomState();
}

class _ChatroomState extends State<Chatroom> {
  @override
  void initState() {
    context.read<Chatbloc>().getChatroom();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        context.read<Chatbloc>().closechatrooms();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55.h),
          child: const ChatroomAppbar(),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<Chatbloc, Chatstate>(
              builder: (context, state) {
                if (state is Loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SuccesgetchatRoom) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.data.length,
                      itemBuilder: (context, index) {
                        final item = state.data[index];
                        if (state.data.isEmpty) {
                          return const Center(
                            child: Text("not found any chat "),
                          );
                        } else {
                          return ChatroomContainerBody(
                            item: item,
                            myUid: state.myUid,
                          );
                        }
                      },
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
        floatingActionButton: const ChatroomFloating(),
      ),
    );
  }
}

import "../../../../../paths.dart";

class ChatroomAppbar extends StatelessWidget {
  const ChatroomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      title: Padding(
        padding: const EdgeInsets.only(left: 30.0, top: 30),
        child: Text(
          "Chat App",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontSize: 20.sp,
          ),
        ),
      ),
      elevation: 1,
    );
  }
}

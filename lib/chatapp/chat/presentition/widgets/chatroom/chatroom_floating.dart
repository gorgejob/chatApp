import "../../../../../paths.dart";


class ChatroomFloating extends StatelessWidget {
  const ChatroomFloating({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<Chatbloc>().navigatortopage(
          context,
          const ContactsScreen(),
        );
      },
      icon: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 61, 202, 66),
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Icon(Icons.add_call, color: Colors.white, size: 30),
      ),
    );
  }
}

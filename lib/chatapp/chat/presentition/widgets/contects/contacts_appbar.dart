import "../../../../../paths.dart";

class ContactsAppbar extends StatelessWidget {
  const ContactsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      title: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                context.read<Chatbloc>().navigatortopage(
                  context,
                  const Chatroom(),
                );
              },
              icon: const Icon(Icons.arrow_back_ios, size: 30),
            ),
            const SizedBox(width: 20),
            Text(
              "Contects",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 20.sp,
              ),
            ),
          ],
        ),
      ),
      elevation: 1,
    );
  }
}

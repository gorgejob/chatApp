import "../../../../../paths.dart";

class ContactsContainer extends StatelessWidget {
  const ContactsContainer({super.key, required this.item});
  final UserModel item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<Chatbloc>().navigatortopage(
          context,
          ChatroomScreen1(receverid: item),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: const AssetImage("assets/gorge.png"),
              // backgroundImage: NetworkImage(
              // "https://beecrowd.com/wp-content/uploads/2024/04/2022-06-23-Flutter.jpg",
              // ),
              // child: Image.asset("assets/gorge.png"),
              radius: 20.w,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Icon(Icons.navigate_next_sharp, size: 40),
          ],
        ),
      ),
    );
  }
}

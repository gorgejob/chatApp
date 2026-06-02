import "../../../../../paths.dart";

class WhatsAppbar extends StatelessWidget {
  const WhatsAppbar({super.key, required this.image, required this.name});
  final String image, name;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actionsPadding: EdgeInsets.zero,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              context.read<Chatbloc>().closemessages();

              context.read<Chatbloc>().navigatortopage(
                context,
                const Chatroom(),
              );
            },
            icon: Icon(Icons.arrow_back_ios, size: 20.w),
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            backgroundImage: const AssetImage("assets/gorge.png"),
            // backgroundImage: NetworkImage(
            // "https://beecrowd.com/wp-content/uploads/2024/04/2022-06-23-Flutter.jpg",
            // ),
            // child: Image.asset("assets/gorge.png"),
            radius: 16.w,
          ),
          const SizedBox(width: 20),
          Text(
            name,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
      elevation: 1,
    );
  }
}

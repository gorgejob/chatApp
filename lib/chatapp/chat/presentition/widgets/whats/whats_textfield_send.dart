import "../../../../../paths.dart";

class WhatsTextfieldSend extends StatelessWidget {
  WhatsTextfieldSend({super.key, required this.receverid});
  final TextEditingController textEditingController = TextEditingController();
  final UserModel receverid;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      margin: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            offset: Offset(5, 8),
            blurRadius: 20,
            color: Color.fromARGB(255, 206, 206, 206),
          ),
          BoxShadow(
            blurRadius: 20,
            offset: Offset(-5, 8),
            color: Color.fromARGB(255, 206, 206, 206),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              controller: textEditingController,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 13.sp,

                color: Colors.black,
              ),

              decoration: InputDecoration(
                hintText: "Send Message",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 13.sp,
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.5),
                ),
                border: const OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              context.read<Chatbloc>().addmessage(
                textEditingController.text,
                receverid,
              );
              textEditingController.text = "";
            },
            // ignore: deprecated_member_use
            icon: Icon(
              Icons.send,
              color: Colors.black.withOpacity(0.5),
              size: 18.w,
            ),
          ),
        ],
      ),
    );
  }
}

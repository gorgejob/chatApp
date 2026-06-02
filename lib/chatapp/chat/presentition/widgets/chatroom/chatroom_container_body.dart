import 'package:chrush/chatapp/chat/data/model/chatroom.dart';
import 'package:chrush/chatapp/chat/presentition/cubit/cubit.dart';
import 'package:chrush/chatapp/chat/presentition/screens/chatroom_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatroomContainerBody extends StatelessWidget {
  const ChatroomContainerBody({
    super.key,
    required this.item,
    required this.myUid,
  });
  final Chatroom item;
  final String myUid;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<Chatbloc>().closechatrooms();
        context.read<Chatbloc>().navigatortopage(
          context,
          ChatroomScreen(
            receverid: item.participants.firstWhere(
              (element) => element.id != myUid,
            ),
            chatid: item.chatRoomId,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          children: [
            // الـ CircleAvatar لوحدها بدون Column ملوش لازمة
            const CircleAvatar(
              backgroundImage: AssetImage("assets/gorge.png"),
              radius: 30,
            ),

            // استخدمنا Expanded هنا عشان ياخد المساحة الباقية ويزق الأيقونة للآخر
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize:
                      MainAxisSize.min, // عشان مياخدش مساحة رأسية بزيادة
                  children: [
                    Text(
                      item.participants
                          .firstWhere((element) => element.id != myUid)
                          .name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 15.sp,
                      ),
                    ),
                    Text(
                      item.lastMessage.length > 40
                          ? '${item.lastMessage.substring(0, 40)}...'
                          : item.lastMessage,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
            ),

            // الأيقونة هتروح أوتوماتيك للآخر بسبب الـ Expanded اللي قبلها
            Icon(Icons.navigate_next_sharp, size: 30.w),
          ],
        ),
      ),
    );
  }
}

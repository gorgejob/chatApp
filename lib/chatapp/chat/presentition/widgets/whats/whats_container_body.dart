import "../../../../../paths.dart";

class WhatsContainerBody extends StatelessWidget {
  const WhatsContainerBody({
    super.key,
    required this.isMe,
    required this.text,
    required this.isSeen, // ضفنا الـ isSeen هنا عشان نعرف الرسالة اتتشافت ولا لأ
  });

  final bool isMe;
  final String text;
  final bool isSeen;

  @override
  Widget build(BuildContext context) {
    return Align(
      // لفتة سريعة: العرف في شات الواتساب إن رسائلي (isMe) بتكون على اليمين والطرف التاني على الشمال
      // لو حابب تعكسهم غير الـ alignment هنا
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue[400] : Colors.grey[300],
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(15),
            topRight: const Radius.circular(15),
            bottomLeft: Radius.circular(
              isMe ? 15 : 0,
            ), // عكستها لتتناسب مع الـ alignment الجديد
            bottomRight: Radius.circular(isMe ? 0 : 15),
          ),
        ),
        child: Row(
          mainAxisSize:
              MainAxisSize
                  .min, // عشان الـ Row ياخد مساحة الكلام بالظبط ميتفردش لآخر الشاشة
          crossAxisAlignment:
              CrossAxisAlignment.end, // عشان الأيقونة تنزل تحت جنب آخر السطر
          children: [
            // لفيت النص بـ Flexible عشان لو الكلام طويل ينزل سطر جديد وميزقش الأيقونة بره الشاشة
            Flexible(
              child: Text(
                text,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black,
                  fontWeight:
                      FontWeight
                          .w600, // و 900 بيكون عريض بزيادة، 600 مريح أكتر للعين
                  fontSize: 12.sp,
                ),
              ),
            ),

            // علامات الصح بتظهر فقط في رسائلي أنا (لما يكون isMe بـ true)
            if (isMe) ...[
              const SizedBox(width: 8), // مسافة صغيرة بين النص والأيقونة
              Icon(
                Icons.done_all_rounded, // علامة الصح المزدوجة
                size: 12.sp,
                // لو شافها (isSeen == true) تلون أزرق (أوcyan)، لو لسه مروحتش تبقى رمادي أو أبيض خفيف
                color:
                    isSeen
                        ? const Color.fromARGB(255, 0, 0, 0)
                        : const Color.fromARGB(153, 253, 5, 5),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

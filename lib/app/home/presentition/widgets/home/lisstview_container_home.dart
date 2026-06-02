import 'package:chrush/app/home/data/models/books_model.dart';
import 'package:chrush/app/home/presentition/cubit/cubit.dart';
import 'package:chrush/app/home/presentition/screens/pageview_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class LisstviewContainerHome extends StatefulWidget {
  const LisstviewContainerHome({super.key, required this.item});
  final BooksModel item ; 

  @override
  State<LisstviewContainerHome> createState() => _LisstviewContainerHomeState();
}

class _LisstviewContainerHomeState extends State<LisstviewContainerHome> {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Container(
                  padding:const EdgeInsets.symmetric(horizontal: 20),
                  margin:const EdgeInsets.only(top: 50, left: 30, right: 30),
                  height: 450,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     const SizedBox(height: 50),
                     const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "image Product",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                     const Spacer(),
                      Text(
                        widget.item.name,
                        style:const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        widget.item.descapation,
                        style:const TextStyle(
                          color:  Color.fromARGB(255, 119, 118, 118),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      // container navigator to page view product and price product
                      Row(
                        children: [
                          Text(
                            "${widget.item.price}\$",
                            style:const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                         const Spacer(),
                          GestureDetector(
                            onTap:
                                () => context.read<HomeCubit>().navigatortopage(
                                  context,
                                const  PageviewProduct(),
                                ),
                            child: GestureDetector(
                              onTap: () async {
                                final XFile? pickedFile = await _picker
                                    .pickImage(
                                      source: ImageSource.gallery,
                                      imageQuality: 80,
                                    );

                                // التحقق من أن المستخدم لم يغلق الاستوديو دون اختيار صورة
                                if (pickedFile == null) {
                                  print("لم يتم اختيار أي صورة.");
                                  return;
                                }
                                final gorge = randomAlpha(10);
                                // تحويل المسار إلى ملف File واستدعاء دالة الرفع فوراً
                                context.read<HomeCubit>().addbook(
                                  BooksModel(
                                    id: gorge,
                                    imagepath: pickedFile.path,
                                    name: "كتاب محمد صلاح 200",
                                    descapation: "كتاب مهم جدا ",
                                    price: "150000000",
                                    count: "150",
                                    lasttime: "لقخلبلي",
                                  ),
                                );
                              },
                              child: Container(
                                margin:const EdgeInsets.symmetric(vertical: 20),
                                padding:const EdgeInsets.only(
                                  top: 5,
                                  bottom: 5,
                                  left: 20,
                                  right: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child:const Row(
                                  children: [
                                    Text(
                                      "Add to cards",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Icon(
                                      Icons.navigate_next_sharp,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
  }
}
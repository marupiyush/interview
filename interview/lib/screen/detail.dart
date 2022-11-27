import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:interview/screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Detail extends StatefulWidget {
  final String title;
  final String price;
  final String description;
  final String image;
  const Detail({Key? key, required this.title, required this.price, required this.description, required this.image}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration:  BoxDecoration(
              color: Colors.purple,
              image: DecorationImage(image: NetworkImage(widget.image),fit: BoxFit.cover)
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 33, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 38,
                    width: 38,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: const Icon(Icons.arrow_back, size: 19),
                  ),
                ),
                const Text(
                  "Detail",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black, letterSpacing: 0.5),
                ),
                 IconButton(onPressed: () async {
                   Get.off(() => (const LoginScreen()));
                   final pref = await SharedPreferences.getInstance();
                   await pref.clear();
                }, icon: const Icon(Icons.more_vert)),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Container(
                width: double.infinity,
                height: 350,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 25,left: 25),
                  child: Column(
                    children: [
                      Row(
                        children: [
                           Expanded(
                            flex: 3,
                            child: Text(
                              widget.title,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black, letterSpacing: 1),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  const Text(
                                    "Price",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black54, letterSpacing: 0.4),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    widget.price,
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black, letterSpacing: 0.4),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const  Icon(Icons.ac_unit),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              height: 60,
                              decoration: const BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30))),
                              child: Row(
                                children:  [
                                  const SizedBox(width: 20),
                                  const Text(
                                    "Color",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 15,horizontal: 4),
                                    child: VerticalDivider(thickness: 1),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: const BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle
                                    ),
                                  ),
                                  const SizedBox(width: 12),Container(
                                    height: 35,
                                    width: 35,
                                    decoration: const BoxDecoration(
                                        color: Colors.yellow,
                                        shape: BoxShape.circle
                                    ),
                                    child: const Icon(Icons.check_circle,color: Colors.white,size: 17,),
                                  ),
                                  const SizedBox(width: 12),Container(
                                    height: 30,
                                    width: 30,
                                    decoration: const BoxDecoration(
                                        color: Colors.black,
                                        shape: BoxShape.circle
                                    ),
                                  ),
                                  const SizedBox(width: 12),Container(
                                    height: 30,
                                    width: 30,
                                    decoration: const BoxDecoration(
                                        color: Colors.indigo,
                                        shape: BoxShape.circle
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                       Text(widget.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle( fontSize: 15, color: Colors.black),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15,top: 20),
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(35),
                              ),
                            ),
                            child:  const Text(
                              "Shop Now",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white, letterSpacing: 0.4),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

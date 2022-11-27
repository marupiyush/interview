import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:interview/Model/item.dart';
import 'package:interview/controller/new_home_controller.dart';
import 'package:interview/screen/detail.dart';


class NewHome extends StatefulWidget {
  const NewHome({Key? key}) : super(key: key);

  @override
  State<NewHome> createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {

  @override
  void initState() {
    NewHomeController.to.callApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 13, right: 13, top: 13),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.all(Radius.circular(27)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 13, bottom: 15, left: 14, right: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.ac_unit),
                          SizedBox(width: 5),
                          Text(
                            "Moli",
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: Colors.white, letterSpacing: 1),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "The Most Unique Light",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white, letterSpacing: 0.9),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "For Daily Living",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white, letterSpacing: 1),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 50,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                              child: const Text(
                                "Explore",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black, letterSpacing: 0.3),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "New Arrival",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black, letterSpacing: 1),
                ),
              ),
              Obx(() =>NewHomeController.to.item.isEmpty?const Center(child: CircularProgressIndicator(color: Colors.purple,)) :Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GridView.builder(
                  itemCount: NewHomeController.to.item.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 17, mainAxisSpacing: 17, childAspectRatio: 0.75),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: (){
                        Get.to(() => ( Detail(title: NewHomeController.to.item[index].title.toString(),description: NewHomeController.to.item[index].description.toString(),price: NewHomeController.to.item[index].price.toString(),image: NewHomeController.to.item[index].image.toString(),)));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration:  BoxDecoration(
                                color: Colors.purple,
                                image: DecorationImage(image: NetworkImage(NewHomeController.to.item[index].image.toString()),fit: BoxFit.cover),
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10, bottom: 10),
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 17,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              NewHomeController.to.item[index].title.toString(),
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black, letterSpacing: 1),
                            ),
                          ),
                          const SizedBox(height: 3),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "\$${NewHomeController.to.item[index].price.toString()}",
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black, letterSpacing: 1),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

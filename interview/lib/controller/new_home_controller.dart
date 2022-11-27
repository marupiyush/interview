import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Model/item.dart';


class NewHomeController extends GetxController {
  static NewHomeController get to => Get.find();

  RxList<Item> item=RxList();
  Future<void> callApi() async {
    var response = await http.get(Uri.parse("https://fakestoreapi.com/products"),headers: {'q': '{http}'});
    if (response.statusCode == 200) {
      List responseList=jsonDecode(response.body);
      responseList.forEach((v) {
        item.add(Item.fromJson(v));
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
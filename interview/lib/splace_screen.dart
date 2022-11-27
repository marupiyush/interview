import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:interview/screen/bottom_navigation.dart';
import 'package:interview/screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({Key? key}) : super(key: key);

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {

  Future<void> checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    String userName = prefs.getString('userName').toString();
    String  password = prefs.getString('password').toString();

    if(userName!="null"&&password!="null")
      {Future.delayed(const Duration(seconds: 3), () {

        Get.off(() => (const Nav()));

      });
      }
    else{
      Future.delayed(const Duration(seconds: 3), () {

        Get.off(() => (const LoginScreen()));

      });
    }
  }

  @override
  void initState() {
    checkLogin();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: Colors.pinkAccent,
        child: const Center(
          child: SpinKitSquareCircle(
            color: Colors.white,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}

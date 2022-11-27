import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview/screen/new_home.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int currentIndex = 0;
  List pages = [const NewHome(), Container(),
     Container(), Container(), Container()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: SizedBox(
        height: 85,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black12,
          //selectedFontSize: 10,
          //unselectedFontSize: 10,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() => currentIndex = value);
          },
          items:  [
            BottomNavigationBarItem(
              activeIcon: Card(
                elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),

                  ),
                child: Container(
                  height: 45,
                    width: 45,
                    decoration: const BoxDecoration(
                      //shape: BoxShape.circle,
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(40))
                    ),

                    child: const Icon(Icons.home_outlined, size: 30)),
              ),
              label: '',
              icon: const Padding(
                padding: EdgeInsets.all(0),
                child: Icon(Icons.home_outlined, size: 30),
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  //set border radius more than 50% of height and width to make circle
                ),
                child: Container(
                    height: 45,
                    width: 45,
                    decoration: const BoxDecoration(
                      //shape: BoxShape.circle,
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(40))
                    ),

                    child: const Icon(Icons.grid_view, size: 30)),
              ),
              label: '',
              icon: const Padding(
                padding: EdgeInsets.all(0),
                child: Icon(Icons.grid_view, size: 30),
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  //set border radius more than 50% of height and width to make circle
                ),
                child: Container(
                    height: 45,
                    width: 45,
                    decoration: const BoxDecoration(
                      //shape: BoxShape.circle,
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(40))
                    ),

                    child: const Icon(Icons.search, size: 30)),
              ),
              label: '',
              icon: const Padding(
                padding: EdgeInsets.all(0),
                child: Icon(Icons.search, size: 30),
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  //set border radius more than 50% of height and width to make circle
                ),
                child: Container(
                    height: 45,
                    width: 45,
                    decoration: const BoxDecoration(
                      //shape: BoxShape.circle,
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(40))
                    ),

                    child: const Icon(Icons.save_outlined, size: 30)),
              ),
              label: '',
              icon: const Padding(
                padding: EdgeInsets.all(0),
                child: Icon(Icons.save_outlined, size: 30),
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  //set border radius more than 50% of height and width to make circle
                ),
                child: Container(
                    height: 45,
                    width: 45,
                    decoration: const BoxDecoration(
                      //shape: BoxShape.circle,
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(40))
                    ),

                    child: const Icon(Icons.shopping_cart_outlined, size: 30)),
              ),
              label: '',
              icon: const Padding(
                padding: EdgeInsets.all(0),
                child: Icon(Icons.shopping_cart_outlined, size: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

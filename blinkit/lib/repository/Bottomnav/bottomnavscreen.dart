import 'package:blinkit/repository/Cart/cartscreen.dart';
import 'package:blinkit/repository/Category/categoryscreen.dart';
import 'package:blinkit/repository/Home/homescreen.dart';
import 'package:blinkit/repository/Print/printscreeen.dart';
import 'package:blinkit/repository/Widgets/uihelper.dart';
import 'package:flutter/material.dart';

class Bottomnavscreen extends StatefulWidget {
  const Bottomnavscreen({super.key});

  @override
  State<Bottomnavscreen> createState() => _BottomnavscreenState();
}

class _BottomnavscreenState extends State<Bottomnavscreen> {
  int currentIndex = 0;
  List<Widget> pages = [
    Homescreen(),
    Cartscreen(),
    Categoryscreen(),
    Printscreeen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Uihelper.customImage(img: 'home.png'),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Uihelper.customImage(img: 'cart.png'),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Uihelper.customImage(img: 'cat.png'),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Uihelper.customImage(img: 'print.png'),
            label: "Print",
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}

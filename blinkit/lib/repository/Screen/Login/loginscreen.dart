import 'package:blinkit/repository/Bottomnav/bottomnavscreen.dart';
import 'package:blinkit/repository/Widgets/uihelper.dart';
import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 280,
              width: double.infinity,
              child: Uihelper.customImage(img: 'onboard.png'),
            ),
            SizedBox(height: 20),
            Uihelper.customImage(img: 'iconn.PNG'),
            SizedBox(height: 10),
            Uihelper.customText(
              text: "India's last minute app ",
              color: Color(0XFF000000),
              fontweight: FontWeight.bold,
              fontsize: 20,
            ),
            SizedBox(height: 10),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(18),
              ),
              child: Container(
                height: 200,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0XFFFFFFFF),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 6),
                    Uihelper.customText(
                      text: 'Sushant',
                      color: Colors.black,
                      fontweight: FontWeight.bold,
                      fontsize: 14,
                    ),
                    SizedBox(height: 4),
                    Uihelper.customText(
                      text: '98xxxxxxxxx',
                      color: Colors.black,
                      fontweight: FontWeight.bold,
                      fontsize: 14,
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 48,
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Bottomnavscreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade500,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Uihelper.customText(
                              text: "Login with",
                              color: Colors.white,
                              fontweight: FontWeight.bold,
                              fontsize: 16,
                            ),
                            SizedBox(width: 6),
                            Uihelper.customImage(img: 'zom.png'),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 4),
                    Uihelper.customText(
                      text:
                          'Access your saved addresses from Zomato Automatically!',
                      color: Colors.grey.shade400,
                      fontweight: FontWeight.normal,
                      fontsize: 10,
                    ),
                    SizedBox(height: 28),
                    Uihelper.customText(
                      text: "or login with phone number",
                      color: Colors.green,
                      fontweight: FontWeight.normal,
                      fontsize: 14,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

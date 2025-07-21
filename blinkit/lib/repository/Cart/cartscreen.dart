import 'package:blinkit/repository/Widgets/uihelper.dart';
import 'package:flutter/material.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          Stack(
            children: [
              Container(
                height: 190,
                width: double.infinity,
                color: Color(0XFFF7CB45),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Uihelper.customText(
                          text: 'Blinkit in',
                          color: Color(0XFF000000),
                          fontweight: FontWeight.bold,
                          fontsize: 15,
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Uihelper.customText(
                          text: '16 Minutes',
                          color: Color(0XFF000000),
                          fontweight: FontWeight.bold,
                          fontsize: 20,
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Uihelper.customText(
                          text: 'Home - Sushant,Kathmandu,Kumari Club ',
                          color: Color(0XFF000000),
                          fontweight: FontWeight.bold,
                          fontsize: 12,
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Uihelper.customTextField(controller: searchController),
                  ],
                ),
              ),
              Positioned(
                right: 20,
                bottom: 100,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Colors.black, size: 20),
                ),
              ),
              // Positioned( bottom: 30,left:20  ),
            ],
          ),
          SizedBox(height: 10),
          // Uihelper.customImage(img: 'av.jpg'),
          Icon(Icons.shopping_cart, size: 70, color: Colors.red),
          SizedBox(height: 10),
          Uihelper.customText(
            text: "ReOrdering will be Easy",
            color: Colors.black,
            fontweight: FontWeight.bold,
            fontsize: 16,
          ),
          Uihelper.customText(
            text: "Items you order will show up here so you can buy ",
            color: Colors.black,
            fontweight: FontWeight.bold,
            fontsize: 12,
          ),
          Uihelper.customText(
            text: "them again easily.",
            color: Colors.black,
            fontweight: FontWeight.bold,
            fontsize: 12,
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 10),
              Uihelper.customText(
                text: "BestSeller",
                color: Colors.black,
                fontweight: FontWeight.bold,
                fontsize: 20,
              ),
            ],
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              children: [
                Stack(
                  children: [
                    Uihelper.customImage(img: '451.png'),
                    Padding(
                      padding: EdgeInsets.only(top: 90, left: 60),
                      child: Uihelper.customButton(() {}),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 120),
                      child: Uihelper.customText(
                        text: 'Amul Taaza \n Toned',
                        color: Colors.black,
                        fontweight: FontWeight.normal,
                        fontsize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 15),
                Stack(
                  children: [
                    Uihelper.customImage(img: '452.png'),
                    Padding(
                      padding: EdgeInsets.only(top: 90, left: 60),
                      child: Uihelper.customButton(() {}),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 120),
                      child: Uihelper.customText(
                        text: 'Parasite Free \n Tomato',
                        color: Colors.black,
                        fontweight: FontWeight.normal,
                        fontsize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 15),

                Stack(
                  children: [
                    Uihelper.customImage(img: '451.png'),
                    Padding(
                      padding: EdgeInsets.only(top: 90, left: 60),
                      child: Uihelper.customButton(() {}),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 120),
                      child: Uihelper.customText(
                        text: 'Amul Taaza \n Toned',
                        color: Colors.black,
                        fontweight: FontWeight.normal,
                        fontsize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

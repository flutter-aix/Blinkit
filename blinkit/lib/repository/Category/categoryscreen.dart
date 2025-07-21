import 'package:blinkit/repository/Widgets/uihelper.dart';
import 'package:flutter/material.dart';

class Categoryscreen extends StatefulWidget {
  const Categoryscreen({super.key});

  @override
  State<Categoryscreen> createState() => _CategoryscreenState();
}

class _CategoryscreenState extends State<Categoryscreen> {
  var searchController = TextEditingController();
  var groceryKitchen = [
    {'img': 'image 41.png', "text": "Dry Fruits \n & Cereals"},
    {'img': 'image 42.png', "text": "Atta, Dal \n & Rice"},
    {'img': 'image 43.png', "text": "Oil, Ghee \n & Masala"},
    {'img': 'image 44.png', "text": "Dairy, Bread \n & Milk"},
    {'img': 'image 45.png', "text": "Biscuits \n & Bakery"},
    {'img': 'image 21.png', "text": "Dry Fruits \n & Cereals"},
    {'img': 'image 22.png', "text": "Kitchen \n & Appliances"},
    {'img': 'image 23.png', "text": "Tea \n & Coffees"},
    {'img': 'image 24.png', "text": "Ice Creams \n & much more"},
    {'img': 'image 25.png', "text": "Noodles \n & Packet Food"},
  ];
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
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 10),
              Uihelper.customText(
                text: 'Grocery and Kitchen',
                color: Colors.black,
                fontweight: FontWeight.bold,
                fontsize: 14,
              ),
            ],
          ),
          SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 3),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: Container(
                          height: 78,
                          width: 71,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0XFFD9EBEB),
                          ),
                          child: Uihelper.customImage(
                            img: groceryKitchen[index]['img'].toString(),
                          ),
                        ),
                      ),
                      Uihelper.customText(
                        text: groceryKitchen[index]['text'].toString(),
                        color: Colors.black,
                        fontweight: FontWeight.normal,
                        fontsize: 10,
                      ),
                    ],
                  );
                },
                itemCount: groceryKitchen.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
          // Drinks and Alcohol
          Row(
            children: [
              SizedBox(width: 10),
              Uihelper.customText(
                text: 'Drinks and Alcohol',
                color: Colors.black,
                fontweight: FontWeight.bold,
                fontsize: 14,
              ),
            ],
          ),
          SizedBox(height: 6),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 3),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: Container(
                          height: 78,
                          width: 71,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0XFFD9EBEB),
                          ),
                          child: Uihelper.customImage(
                            img: groceryKitchen[index]['img'].toString(),
                          ),
                        ),
                      ),
                      Uihelper.customText(
                        text: groceryKitchen[index]['text'].toString(),
                        color: Colors.black,
                        fontweight: FontWeight.normal,
                        fontsize: 10,
                      ),
                    ],
                  );
                },
                itemCount: groceryKitchen.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),

          // Drinks and Alcohol
        ],
      ),
    );
  }
}

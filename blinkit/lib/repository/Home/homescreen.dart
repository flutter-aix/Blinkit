import 'package:blinkit/repository/Widgets/uihelper.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  var searchController = TextEditingController();
  var data = [
    {'img': 'image 50.png', 'text': "Lights, Diyas \n & Candles"},
    {'img': 'image 51.png', 'text': "Diwali Gifts"},
    {'img': 'image 52.png', 'text': "Appliances \n & Gadgets"},
    {'img': 'image 53.png', 'text': "Home \n & Living"},
  ];

  var pdata = [
    {'img': 'image 56.png', 'text': "Lights, Diyas \n & Candles"},
    {'img': 'image 57.png', 'text': "Diwali Gifts"},
    {'img': 'image 56.png', 'text': "Appliances \n & Gadgets"},
    {'img': 'image 57.png', 'text': "Home \n & Living"},
  ];

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
          // Stack(
          //   children: [
          //     Container(
          //       height: 170,
          //       width: double.infinity,
          //       color: Colors.redAccent,
          //       child: Column(
          //         children: [
          //           SizedBox(height: 30),
          //           Row(
          //             children: [
          //               SizedBox(width: 20),
          //               Uihelper.customText(
          //                 text: 'Blinkit in',
          //                 color: Colors.white,
          //                 fontweight: FontWeight.bold,
          //                 fontsize: 15,
          //               ),
          //             ],
          //           ),
          //           SizedBox(height: 2),
          //           Row(
          //             children: [
          //               SizedBox(width: 20),
          //               Uihelper.customText(
          //                 text: '16 Minutes',
          //                 color: Colors.white,
          //                 fontweight: FontWeight.bold,
          //                 fontsize: 20,
          //               ),
          //             ],
          //           ),
          //           SizedBox(height: 2),
          //           Row(
          //             children: [
          //               SizedBox(width: 20),
          //               Uihelper.customText(
          //                 text: 'Home - Sushant,Kathmandu,Kumari Club ',
          //                 color: Colors.white,
          //                 fontweight: FontWeight.bold,
          //                 fontsize: 12,
          //               ),
          //             ],
          //           ),
          //           SizedBox(height: 15),
          //           Uihelper.customTextField(controller: searchController),
          //         ],
          //       ),
          //     ),
          //     Positioned(
          //       right: 20,
          //       bottom: 100,
          //       child: CircleAvatar(
          //         radius: 20,
          //         backgroundColor: Colors.black,
          //         child: Icon(Icons.person, color: Colors.white, size: 24),
          //       ),
          //     ),
          //   ],
          // ),
          SizedBox(height: 2),
          // Next Container
          Container(
            height: 195,
            width: double.infinity,
            color: Colors.redAccent,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Uihelper.customImage(img: 's2.png'),
                    Uihelper.customImage(img: 's1.png'),
                    Uihelper.customText(
                      text: "Mega Diwali Sale",
                      color: Colors.white,
                      fontweight: FontWeight.bold,
                      fontsize: 16,
                    ),
                    Uihelper.customImage(img: 's1.png'),
                    Uihelper.customImage(img: 's2.png'),
                  ],
                ),
                // Mega Sales
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 108,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade300,
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Uihelper.customText(
                                    text: data[index]['text'].toString(),
                                    color: Colors.black,
                                    fontweight: FontWeight.normal,
                                    fontsize: 12,
                                  ),
                                  Uihelper.customImage(
                                    img: data[index]['img'].toString(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: data.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Product Sales
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 110,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade300,
                          ),
                          child: Center(
                            child: Uihelper.customImage(
                              img: pdata[index]['img'].toString(),
                            ),
                          ),
                        ),
                      ),
                      Uihelper.customText(
                        text: pdata[index]['text'].toString(),
                        color: Colors.black,
                        fontweight: FontWeight.normal,
                        fontsize: 12,
                      ),
                      Row(
                        children: [
                          Icon(Icons.alarm, size: 16),
                          SizedBox(width: 8),
                          Uihelper.customText(
                            text: "16 min Ago",
                            color: Colors.black45,
                            fontweight: FontWeight.normal,
                            fontsize: 10,
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          SizedBox(height: 2),
                          Icon(Icons.currency_rupee),
                          Uihelper.customText(
                            text: "88",
                            color: Colors.black45,
                            fontweight: FontWeight.bold,
                            fontsize: 16,
                          ),
                        ],
                      ),
                    ],
                  );
                },
                itemCount: data.length,
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
                          height: 70,
                          width: 70,
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
        ],
      ),
    );
  }
}

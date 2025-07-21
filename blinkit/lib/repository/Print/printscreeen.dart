import 'package:blinkit/repository/Widgets/uihelper.dart';
import 'package:flutter/material.dart';

class Printscreeen extends StatefulWidget {
  const Printscreeen({super.key});

  @override
  State<Printscreeen> createState() => _PrintscreeenState();
}

class _PrintscreeenState extends State<Printscreeen> {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFBF0CE),
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
            ],
          ),

          // Print Section Start
          SizedBox(height: 20),
          Uihelper.customText(
            text: "Print Store",
            color: Colors.black,
            fontweight: FontWeight.bold,
            fontsize: 32,
          ),
          SizedBox(height: 2),
          Uihelper.customText(
            text: "Blinkit ensures secure prints at every stage",
            color: Colors.black,
            fontweight: FontWeight.bold,
            fontsize: 14,
          ),
          SizedBox(height: 40),

          // Documment Container
          Stack(
            children: [
              Container(
                height: 170,
                width: 340,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Uihelper.customText(
                          text: 'Doccuments',
                          color: Colors.black,
                          fontweight: FontWeight.bold,
                          fontsize: 16,
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          SizedBox(width: 2),
                          Uihelper.customImage(img: 's.png'),
                          SizedBox(width: 8),
                          Uihelper.customText(
                            text: "Price starting at rs 3/page",
                            color: Color(0XFF9C9C9C),
                            fontweight: FontWeight.normal,
                            fontsize: 12,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          SizedBox(width: 2),
                          Uihelper.customImage(img: 's.png'),
                          SizedBox(width: 8),
                          Uihelper.customText(
                            text: "Paper quality: 70 GSM",
                            color: Color(0XFF9C9C9C),
                            fontweight: FontWeight.normal,
                            fontsize: 12,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          SizedBox(width: 2),
                          Uihelper.customImage(img: 's.png'),
                          SizedBox(width: 8),
                          Uihelper.customText(
                            text: "Paper quality: 70 GSM",
                            color: Color(0XFF9C9C9C),
                            fontweight: FontWeight.normal,
                            fontsize: 12,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        SizedBox(
                          height: 40,
                          width: 140,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'Upload Files',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20,
                top: 40,
                child: Uihelper.customImage(img: 'paper.png'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

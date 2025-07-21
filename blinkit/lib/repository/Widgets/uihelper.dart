import 'package:flutter/material.dart';

class Uihelper {
  // Custom Image
  static customImage({required String img}) {
    return Image.asset('assets/images/$img');
  }

  // Custom Text
  static customText({
    required String text,
    required Color color,
    required FontWeight fontweight,
    String? fontfamily,
    required double fontsize,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontFamily: fontfamily ?? 'regular',
        fontWeight: fontweight,
        color: color,
      ),
    );
  }

  // Custom TextField
  static customTextField({required TextEditingController controller}) {
    return Container(
      height: 37,
      width: 346,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color: Color(0XFFC5C5C5)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: "Search 'Ice-Cream'",
            // prefix: Image.asset('assets/images/search.png'),
            // suffix: Image.asset('assets/images/mic.png'),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  // Custom Button
  static customButton(VoidCallback callback) {
    return Container(
      height: 18,
      width: 35,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0XFF27AF34)),
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          "Add",
          style: TextStyle(fontSize: 12, color: Color(0XFF27AF34)),
        ),
      ),
    );
  }
}

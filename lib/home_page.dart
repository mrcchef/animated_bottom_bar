import 'package:animated_bottom_bar/model/bottom_button.dart';
import 'package:animated_bottom_bar/model/bottom_button_style.dart';

import 'animated_bottom_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectBottomButtonIndex = 0;

  List<BottomButton> bottomButtonList = [
    BottomButton(
      color: Color(0xff5B37B7),
      iconData: Icons.home,
      text: "Home",
    ),
    BottomButton(
      color: Color(0xffC9379D),
      iconData: Icons.favorite_border,
      text: "Favourites",
    ),
    BottomButton(
      color: Color(0xffE39A28),
      iconData: Icons.search,
      text: "Search",
    ),
    BottomButton(
      color: Color(0xff1194AA),
      iconData: Icons.account_circle_outlined,
      text: "Profile",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Material(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            elevation: 30,
            child: Container(
              child: AnimatedBottomBar(
                bottomButtonList: bottomButtonList,
                bottomButtonStyle: BottomButtonStyle(
                    fontWeight: FontWeight.w600, iconSize: 24, textSize: 16),
                duration: Duration(milliseconds: 150),
                onBarTap: (index) {
                  setState(() {
                    selectBottomButtonIndex = index;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

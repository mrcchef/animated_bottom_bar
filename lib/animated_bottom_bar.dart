import 'package:flutter/material.dart';

import 'model/bottom_button.dart';
import 'model/bottom_button_style.dart';

class AnimatedBottomBar extends StatefulWidget {
  final List<BottomButton> bottomButtonList;
  final Duration duration;
  final BottomButtonStyle bottomButtonStyle;
  final Function onBarTap;

  const AnimatedBottomBar(
      {Key key,
      this.bottomButtonList,
      this.duration,
      this.bottomButtonStyle,
      this.onBarTap})
      : super(key: key);
  @override
  _AnimatedBottomBarState createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar>
    with TickerProviderStateMixin {
  int selectedButtonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: getRowChildren(),
      ),
    );
  }

  List<Widget> getRowChildren() {
    List<Widget> widgetList = [];

    for (int i = 0; i < widget.bottomButtonList.length; i++) {
      BottomButton button = widget.bottomButtonList[i];
      widgetList.add(
        InkWell(
          onTap: () {
            setState(
              () {
                selectedButtonIndex = i;
              },
            );
            widget.onBarTap(selectedButtonIndex);
          },
          child: AnimatedContainer(
            duration: widget.duration,
            decoration: BoxDecoration(
              color: selectedButtonIndex == i
                  ? button.color.withOpacity(0.15)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: AnimatedSize(
              vsync: this,
              duration: widget.duration,
              child: Row(
                children: [
                  Icon(
                    button.iconData,
                    color: button.color,
                    size: widget.bottomButtonStyle.iconSize,
                  ),
                  if (selectedButtonIndex == i) SizedBox(width: 10),
                  if (selectedButtonIndex == i)
                    Text(
                      button.text,
                      style: TextStyle(
                        color: button.color,
                        fontWeight: widget.bottomButtonStyle.fontWeight,
                        fontSize: widget.bottomButtonStyle.textSize,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    return widgetList;
  }
}

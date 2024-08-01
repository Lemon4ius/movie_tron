import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../images/bottom_navigation/bottom_navigation_icon.dart';

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({
    super.key,
  });

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  var isUp = false;
  var previousIndex = 0;
  var _selectedItem = 0;
  final shadowContainerList = [
    ShadowContainerModel(
        icon: BottomNavigationIcon.homeIcon,
        size: 0,
        offset: 100,
        isVisible: false),
    ShadowContainerModel(
        icon: BottomNavigationIcon.playerIcon,
        size: 0,
        offset: 100,
        isVisible: false),
    ShadowContainerModel(
        icon: BottomNavigationIcon.searchIcon,
        size: 0,
        offset: 100,
        isVisible: false),
    ShadowContainerModel(
        icon: BottomNavigationIcon.profileIcon,
        size: 0,
        offset: 100,
        isVisible: false),
  ];

  @override
  void initState() {
    setState(() {
      shadowContainerList[_selectedItem].isVisible = true;
      shadowContainerList[_selectedItem].offset = 0;
      shadowContainerList[_selectedItem].size = 40.0;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 120,
      padding: const EdgeInsets.only(bottom: 10),
      color: const Color.fromRGBO(9, 9, 15, 1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: shadowContainerList.map((iconPath) {
            var index = shadowContainerList.indexOf(iconPath);
            return Column(mainAxisSize: MainAxisSize.min, children: [
              Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.vertical,
                  children: [
                    Stack(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.fastOutSlowIn,
                          decoration:
                              BoxDecoration(shape: BoxShape.circle, boxShadow: [
                            BoxShadow(
                                color: shadowContainerList[index].isVisible
                                    ? const Color.fromRGBO(55, 62, 82, 1)
                                    : Colors.transparent,
                                blurRadius: 60,
                                spreadRadius: 10)
                          ]),
                          height: shadowContainerList[index].size,
                          width: shadowContainerList[index].size,
                        ),
                        IconButton(
                          icon: SvgPicture.asset(
                            shadowContainerList[index].icon,
                            color: _selectedItem == index
                                ? Colors.white
                                : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _selectedItem = index;
                              shadowContainerList[previousIndex].offset = 100;
                              shadowContainerList[previousIndex].size = 0.0;
                              shadowContainerList[previousIndex].isVisible =
                                  false;
                              shadowContainerList[index].offset = 0;
                              shadowContainerList[index].size = 40.0;
                              shadowContainerList[index].isVisible = true;
                              previousIndex = index;
                            });
                          },
                        ),
                      ],
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      transform: Transform.translate(
                        offset: Offset(0, shadowContainerList[index].offset),
                      ).transform,
                      child: const Icon(
                        Icons.circle,
                        color: Colors.white,
                        size: 4,
                      ),
                    )
                  ]),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}

class ShadowContainerModel {
  final String icon;
  double size;
  double offset;
  bool isVisible;

  ShadowContainerModel(
      {required this.icon,
      required this.size,
      required this.offset,
      required this.isVisible});
}

class AnCont {
  double size;

  AnCont(this.size);
}

class SubIcon {
  double offset;

  SubIcon(this.offset);
}

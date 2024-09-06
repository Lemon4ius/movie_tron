import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router/src/route.dart';

import '../colors/app_colors.dart';
import '../images/bottom_navigation/bottom_navigation_icon.dart';
import '../models/bottom_nav_bar/bottom_nav_bar_model.dart';

class AppBottomBar extends StatefulWidget {

  final StatefulNavigationShell navigationShell;

  const AppBottomBar({
    super.key,
    required this.navigationShell,
  });

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
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
      height: 110,
      padding: const EdgeInsets.only(bottom: 10),
      color: AppColors.mainBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 22),
        child: Column(
          children: [
            Row(
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
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            shadowContainerList[index].isVisible
                                                ? AppColors.darkBlue
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

                                  widget.navigationShell.goBranch(
                                      index,
                                      initialLocation: index == widget.navigationShell.currentIndex
                                  );

                                  shadowContainerList[previousIndex].offset =
                                      100;
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
                            offset:
                                Offset(0, shadowContainerList[index].offset),
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
          ],
        ),
      ),
    );
  }
}

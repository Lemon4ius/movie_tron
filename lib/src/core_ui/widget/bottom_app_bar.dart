import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../colors/app_colors.dart';
import '../images/bottom_navigation/bottom_navigation_icon.dart';
import '../models/bottom_nav_bar/bottom_nav_bar_model.dart';

class AppBottomBar extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  final List<ShadowContainerModel> shadowContainerModel;

  const AppBottomBar(
      {super.key,
      required this.navigationShell,
      this.shadowContainerModel = const <ShadowContainerModel>[]});

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  var previousIndex = 0;
  var _selectedItem = 0;
  
  final shadowContainerModel = [
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
    super.initState();
    setState(() {
      shadowContainerModel[_selectedItem].isVisible = true;
      shadowContainerModel[_selectedItem].offset = 0;
      shadowContainerModel[_selectedItem].size = 40.0;
    });
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
              children: shadowContainerModel.map((iconPath) {
                var index = shadowContainerModel.indexOf(iconPath);
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
                                        color: widget
                                                .shadowContainerModel[index]
                                                .isVisible
                                            ? Colors.red
                                            : Colors.transparent,
                                        blurRadius: 60,
                                        spreadRadius: 10)
                                  ]),
                              height: shadowContainerModel[index].size,
                              width: shadowContainerModel[index].size,
                            ),
                            IconButton(
                              icon: SvgPicture.asset(
                                shadowContainerModel[index].icon,
                                colorFilter: ColorFilter.mode(
                                    _selectedItem == index
                                        ? Colors.white
                                        : Colors.grey,
                                    BlendMode.srcIn),
                              ),
                              onPressed: () {
                                animationShadowContainer(index);
                              },
                            ),
                          ],
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          transform: Transform.translate(
                            offset: Offset(
                                0, shadowContainerModel[index].offset),
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

  animationShadowContainer(int index) {
    setState(() {
      _selectedItem = index;
      widget.navigationShell.goBranch(index, initialLocation: index == widget.navigationShell.currentIndex);
      shadowContainerModel[previousIndex].offset = 100;
      shadowContainerModel[previousIndex].size = 0.0;
      shadowContainerModel[previousIndex].isVisible = false;
      shadowContainerModel[index].offset = 0;
      shadowContainerModel[index].size = 40.0;
      shadowContainerModel[index].isVisible = true;
      previousIndex = index;
    });
  }
}

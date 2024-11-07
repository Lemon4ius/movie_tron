import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router/src/route.dart';

import '../colors/app_colors.dart';
import '../images/bottom_navigation/bottom_navigation_icon.dart';
import '../models/bottom_nav_bar/bottom_nav_bar_model.dart';

class AppBottomBar extends StatefulWidget {

  final StatefulNavigationShell navigationShell;
  final List<ShadowContainerModel> shadowContainerList;
  const AppBottomBar({
    super.key,
    required this.navigationShell,
    required this.shadowContainerList
  });

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  var previousIndex = 0;
  var _selectedItem = 0;
  List<ShadowContainerModel> shadowContainerListClone = [];

  @override
  void initState() {
    shadowContainerListClone = List.from(widget.shadowContainerList);
    setState(() {
      shadowContainerListClone[_selectedItem].isVisible = true;
      shadowContainerListClone[_selectedItem].offset = 0;
      shadowContainerListClone[_selectedItem].size = 40.0;
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
              children: shadowContainerListClone.map((iconPath) {
                var index = shadowContainerListClone.indexOf(iconPath);
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
                                            shadowContainerListClone[index].isVisible
                                                ? AppColors.darkBlue
                                                : Colors.transparent,
                                        blurRadius: 60,
                                        spreadRadius: 10)
                                  ]),
                              height: shadowContainerListClone[index].size,
                              width: shadowContainerListClone[index].size,
                            ),
                            IconButton(
                              icon: SvgPicture.asset(
                                shadowContainerListClone[index].icon,
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

                                  shadowContainerListClone[previousIndex].offset =
                                      100;
                                  shadowContainerListClone[previousIndex].size = 0.0;
                                  shadowContainerListClone[previousIndex].isVisible =
                                      false;
                                  shadowContainerListClone[index].offset = 0;
                                  shadowContainerListClone[index].size = 40.0;
                                  shadowContainerListClone[index].isVisible = true;
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
                                Offset(0, shadowContainerListClone[index].offset),
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

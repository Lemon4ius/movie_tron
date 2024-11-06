import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

AnimatedContainer actionButton(BuildContext context, double progress) {
  return AnimatedContainer(
    duration: Duration(
        milliseconds: progress >= 0.8
            ? progress >= 0.83
                ? 250
                : 0
            : 250),
    alignment: progress >= 0.8
        ? progress >= 0.85
            ? Alignment.center
            : Alignment.bottomCenter
        : Alignment.topCenter,
    child: Padding(
      padding:
          EdgeInsets.only(top: progress >= 0.8 ? 0 : 54, left: 42, right: 42),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              toolButton(image: 'assets/image/detail_page/back_ic.svg', progress: progress, onPress: () {
                if(context.canPop()) {
                  context.pop();
                }
              },),
              const Spacer(),
              toolButton(image: 'assets/image/detail_page/heart_ic.svg', progress: progress,onPress: () {
                  //TODO добавить функцию добавления в избранное
              },),
            ],
          ),
        ],
      ),
    ),
  );
}

SizedBox toolButton({required String image, required double progress, required Function() onPress}) {
  return SizedBox(
    height: 36,
    width: 36,
    child: TextButton(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(Colors.white30),
          iconSize: WidgetStateProperty.all(16),
          backgroundColor: WidgetStateProperty.all(
              progress >= 0.88 ? Colors.transparent : Colors.white12),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
              side: BorderSide(
                  //TODO Изменить на нормальный бордер как в фигме с градиентом
                  color: progress >= 0.88
                      ? Colors.transparent
                      : const Color.fromRGBO(255, 255, 255, 0.2)),
              borderRadius: BorderRadius.circular(5)))),
      onPressed: () {
        onPress();
      },
      child: SvgPicture.asset(image),
    ),
  );
}

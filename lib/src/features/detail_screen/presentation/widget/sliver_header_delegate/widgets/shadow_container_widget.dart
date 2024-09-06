import 'package:flutter/material.dart';
import 'package:movie_tron/src/core_ui/colors/app_colors.dart';

Positioned shadowContainerWidget(BuildContext context, double maxSize) {
  return Positioned(
    height: maxSize,
    top: 0,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 226,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    AppColors.mainBackgroundColor,
                    AppColors.mainBackgroundColor,
                    AppColors.mainBackgroundColor50,
                    AppColors.mainBackgroundColor0,
                  ],
                  stops: [
                    0,
                    0.41,
                    0.8,
                    1
                  ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 125),
                child: SizedBox(
                  height: 53,
                  width: 53,
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        overlayColor:
                        WidgetStateProperty.all(Colors.white30),
                        iconSize: WidgetStateProperty.all(27),
                        backgroundColor: WidgetStateProperty.all(
                            const Color.fromRGBO(255, 59, 48, 1)),
                        shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(100)))),
                    child: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
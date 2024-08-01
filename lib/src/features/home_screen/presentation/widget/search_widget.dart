import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

searchingWidget(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 36, right: 48, left: 48),
    height: 52,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromRGBO(118, 118, 128, 0.2),
        border: Border.all(
          color: const Color.fromRGBO(255, 255, 255, 0.1),
        )),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: SvgPicture.asset('assets/image/home_page/search_ic.svg'),
        ),
        const SizedBox(width: 16,),
        const Expanded(
          child: TextField(
            cursorColor: Colors.white,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(160, 160, 160, 1),
                  fontWeight: FontWeight.bold),
              hintText: 'Search',
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 11, bottom: 11,right: 16),
          child: Container(
            color: const Color.fromRGBO(255, 255, 255, 0.3),
            height: double.infinity,
            width: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: SvgPicture.asset(
            'assets/image/home_page/micro_ic.svg',
            color: const Color.fromRGBO(255, 255, 255, 0.3),
          ),
        )
      ],
    ),
  );
}

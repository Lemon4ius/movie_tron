import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../generated/l10n.dart';
import '../../../../core_ui/colors/app_colors.dart';

searchingWidget(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 36, right: 48, left: 48),
    height: 52,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.searchBackgroundColor,
        border: Border.all(
          color: Colors.white10,
        )),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: SvgPicture.asset('assets/image/home_page/search_ic.svg'),
        ),
        const SizedBox(width: 16,),
        Expanded(
          child: TextField(
            cursorColor: Colors.white,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: const TextStyle(
                  fontSize: 14,
                  color: AppColors.grayLight,
                  fontWeight: FontWeight.bold),
              hintText: S.of(context).search,
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 11, bottom: 11,right: 16),
          child: Container(
            color: Colors.white30,
            height: double.infinity,
            width: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: SvgPicture.asset(
            'assets/image/home_page/micro_ic.svg',
            color: Colors.white30,
          ),
        )
      ],
    ),
  );
}

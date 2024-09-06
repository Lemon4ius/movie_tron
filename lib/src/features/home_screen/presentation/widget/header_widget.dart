import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';

Padding headerWidget(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 54, left: 48, right: 47),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(children: [
               TextSpan(text: S.of(context).hello, style: Theme.of(context).textTheme.headlineSmall),
              TextSpan(
                text: S.of(context).daizy,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w300),
              ),
            ])),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                S.of(context).checkForLatestAddition,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            )
          ],
        ),
        const Spacer(),
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset('assets/image/home_page/avatar.png',
              height: 53, width: 53, fit: BoxFit.cover),
        )
      ],
    ),
  );
}

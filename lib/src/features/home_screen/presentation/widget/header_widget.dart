import 'package:flutter/material.dart';

Padding headerWidget(BuildContext context) {
  const titleTextStyle =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white);
  return Padding(
    padding: const EdgeInsets.only(top: 54, left: 48, right: 47),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(children: [
              const TextSpan(text: 'Hello ', style: titleTextStyle),
              TextSpan(
                text: 'Daizy!',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ])),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                'Check for latest addition.',
                style: Theme.of(context).textTheme.titleMedium,
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

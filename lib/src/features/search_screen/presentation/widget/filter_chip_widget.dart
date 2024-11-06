import 'package:flutter/material.dart';

import '../search_page.dart';

class FilterChipWidget extends StatefulWidget{
  final GenreChip genre;
  const FilterChipWidget({super.key, required this.genre});

  @override
  State<FilterChipWidget> createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      key: widget.key,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      disabledColor: const Color.fromRGBO(81, 83, 93, 0.25),
      backgroundColor: const Color.fromRGBO(81, 83, 93, 0.25),
      checkmarkColor: Colors.white,
      selectedColor: const Color.fromRGBO(81, 83, 93, 1),
      selected: widget.genre.selected,
      label: Text(
        widget.genre.label,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
      ),
      onSelected: (value) {
        setState(() {
          widget.genre.selected = value;
        });
        // value = false;
      },
    );
  }
}
import 'dart:math' as math;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_tron/src/features/home_screen/domain/models/popular_film_response/popular_film_response.dart';

import '../bloc/home_bloc.dart';
import '../models/slider_model.dart';
import 'carousel_element_widget.dart';

class CarouselSliderWidget extends StatefulWidget {
  final Set<PopularFilmResponse> popularFilmList;
  final BoxConstraints constraints;

  const CarouselSliderWidget(this.popularFilmList, this.constraints,
      {super.key});

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget>
    with TickerProviderStateMixin {
  late List<SliderModel> popularFilmsSlider = [];
  var _pageNow = 0;
  var _pagePrevious=0;
  var _pageNext=0;
  var degree = -math.e / 14;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    widget.popularFilmList.toList().forEach(
      (item) {
        popularFilmsSlider.add(SliderModel(item.id,0, 0, item.posterImage));
      },
    );
    popularFilmsSlider[1].degree = 4 * math.pi / 180;
    popularFilmsSlider[1].padding = 20;
    popularFilmsSlider[popularFilmsSlider.length - 1].degree =
        4 * -math.pi / 180;
    popularFilmsSlider[popularFilmsSlider.length - 1].padding = 20;
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _animation = Tween<double>(begin: 0, end: 0).animate(_animationController);
    _pagePrevious = popularFilmsSlider.length - 1;
    _pageNext = _pageNow + 1;
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 36),
      alignment: Alignment.topCenter,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return CarouselSlider.builder(
              itemCount: popularFilmsSlider.length,
              itemBuilder: (context, index, realIndex) {
                return AnimatedBuilder(
                  animation: _animationController,
                  builder: (BuildContext context, Widget? child) {
                    return carouselElement(index, context, popularFilmsSlider,
                        _animationController);
                  },
                );
              },
              options: CarouselOptions(
                clipBehavior: Clip.none,
                height: widget.constraints.maxHeight / 2.5,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(seconds: 1),
                // viewportFraction: ((MediaQuery.of(context).size.width/940)),
                viewportFraction: 0.5,
                onPageChanged: animationLogic
              ));
        },
      ),
    );
  }

  void animationLogic(int index,CarouselPageChangedReason reason) {
    _pagePrevious = index == 0 ? popularFilmsSlider.length - 1 : index - 1;
    _pageNow = index;
    _pageNext = index == popularFilmsSlider.length - 1 ? 0 : index + 1;
    for (var item in popularFilmsSlider) {
      if (popularFilmsSlider.indexOf(item) != _pageNext &&
          popularFilmsSlider.indexOf(item) != _pagePrevious &&
          popularFilmsSlider.indexOf(item) != _pageNow) {
        item.previousDegree = 0;
        item.degree = 0;
      }
    }
    popularFilmsSlider[_pagePrevious].previousDegree =
        popularFilmsSlider[_pagePrevious].degree;
    popularFilmsSlider[_pageNext].previousDegree =
        popularFilmsSlider[_pageNext].degree;
    popularFilmsSlider[_pageNow].previousDegree =
        popularFilmsSlider[_pageNow].degree;

    popularFilmsSlider[_pageNow].degree = 0;
    popularFilmsSlider[_pagePrevious].degree = -math.e / 14;
    popularFilmsSlider[_pageNext].degree = math.e / 14;

    _animationController.reset();
    _animationController.forward();
    setState(() {
      popularFilmsSlider[_pagePrevious].padding = 20;
      popularFilmsSlider[_pageNow].padding = 0;
      popularFilmsSlider[_pageNext].padding = 20;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

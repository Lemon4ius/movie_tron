import 'package:flutter/material.dart';
import 'package:movie_tron/src/features/home_screen/presentation/widget/carousel_slider_widget.dart';

import '../models/slider_model.dart';

carouselElement(int index, BuildContext context, List<SliderModel> popularFilmsSlider, Animation<double> _animationController) {
  return SizedBox(
    child: Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        AnimatedPositioned(
          top: popularFilmsSlider[index].padding,
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          height: MediaQuery.of(context).size.height/3.3,
          width: MediaQuery.of(context).size.height/4.5,
          child: Transform.rotate(
            angle: Tween<double>(
                begin: popularFilmsSlider[index].previousDegree,
                end: popularFilmsSlider[index].degree)
                .animate(_animationController)
                .value,
            child: ClipRRect(
                borderRadius: const BorderRadius.all(
                    Radius.circular(27)),
                child: Image.network(
                  loadingBuilder: (context, child, loadingProgress) {
                    if(loadingProgress==null) return child;
                    else {
                      return const Center(child: CircularProgressIndicator(color: Colors.white,));
                    }
                  },
                  'https://image.tmdb.org/t/p/w780/${popularFilmsSlider[index].image}',
                  fit: BoxFit.cover,
                )),
          ),
        ),
      ],
    ),
  );
}
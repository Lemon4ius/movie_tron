import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_tron/src/core/constants/image_network_base_path.dart';
import 'package:movie_tron/src/features/detail_screen/presentation/detail_page.dart';

import '../models/slider_model.dart';

carouselElement(
    int index,
    BuildContext context,
    List<SliderModel> popularFilmsSlider,
    Animation<double> _animationController) {
  return SizedBox(
    child: Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        AnimatedPositioned(
          top: popularFilmsSlider[index].padding,
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          height: MediaQuery.of(context).size.height / 3.3,
          width: MediaQuery.of(context).size.height / 4.5,
          child: Transform.rotate(
            angle: Tween<double>(
                    begin: popularFilmsSlider[index].previousDegree,
                    end: popularFilmsSlider[index].degree)
                .animate(_animationController)
                .value,
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(27)),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CachedNetworkImage(
                      progressIndicatorBuilder: (context, url, progress) =>
                          const Center(
                              child: CircularProgressIndicator(
                        color: Colors.white,
                      )),
                      imageUrl:
                          '${ImageNetworkBasePath.carouselSliderImage}/${popularFilmsSlider[index].image}',
                      fit: BoxFit.cover,

                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          context.go('/detail-film/${popularFilmsSlider[index].id}');
                        },
                      ),
                    )
                  ],
                )),
          ),
        ),
      ],
    ),
  );
}

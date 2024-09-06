import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_tron/src/core/constants/image_network_base_path.dart';
import 'package:movie_tron/src/core_ui/colors/app_colors.dart';
import 'package:movie_tron/src/features/detail_screen/presentation/widget/sliver_header_delegate/widgets/action_button_widget.dart';
import 'package:movie_tron/src/features/detail_screen/presentation/widget/sliver_header_delegate/widgets/shadow_container_widget.dart';
import 'package:movie_tron/src/features/detail_screen/presentation/widget/sliver_header_delegate/widgets/subtitle_information_widget.dart';

import '../../bloc/detail_bloc.dart';

class DetailSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  final double maxSize;

  DetailSliverPersistentHeaderDelegate({required this.maxSize});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / maxExtent;
    print(progress);
    return BlocBuilder<DetailBloc, DetailState>(
      builder: (context, state) {
        if (state is DetailInitialState) {
          return Stack(
            fit: StackFit.expand,
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                height: 414,
                width: MediaQuery.of(context).size.width,
                top: 0,
                child: AnimatedContainer(
                  duration: Duration.zero,
                  color: progress > 0.88
                      ? AppColors.mainBackgroundColor
                      : Colors.transparent,
                  child: AnimatedOpacity(
                    opacity: progress > 0.87 ? 0 : 1 - progress,
                    duration: const Duration(milliseconds: 100),
                    child: Image.network(
                      '${ImageNetworkBasePath.posterImage}/${state.detailFilm.backdropPath}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              actionButton(context,progress),
              shadowContainerWidget(context, maxSize),
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                alignment:
                    progress > 0.85 ? Alignment.center : Alignment.bottomCenter,
                margin: EdgeInsets.only(bottom: (progress < 0.2) ? 61 : 0),
                child: AnimatedContainer(
                  width: progress>0.67?MediaQuery.of(context).size.width-(42*2+36*2): MediaQuery.of(context).size.width,
                  duration: const Duration(milliseconds: 440),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      textAlign: TextAlign.center,
                      maxLines: progress > 0.67 ?1:2,
                      overflow: TextOverflow.ellipsis,
                      state.detailFilm.title,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
              ),
              subtitleInformation(progress, state, context, maxSize),
            ],
          );
        }
        return Container();
      },
    );
  }

  @override
  double get maxExtent => maxSize;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

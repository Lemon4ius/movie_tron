import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/image_network_base_path.dart';
import '../bloc/detail_bloc.dart';

Padding companiesListView(BuildContext context, DetailInitialState state) {
  return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 221,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          scrollDirection: Axis.horizontal,
          cacheExtent: 999,
          itemBuilder: (context, index) {
            final companies = state.detailFilm.productionCompanies;
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white),
                  child: ClipRRect(
                      // borderRadius: BorderRadius.circular(50),
                      child: CachedNetworkImage(
                        useOldImageOnUrlChange: true,
                        fit: BoxFit.contain,
                        imageUrl:
                        '${ImageNetworkBasePath.peopleImage}/${companies[index].logoPath}',
                        errorWidget: (context, url, error) => Image.asset(
                          //TODO Сделать картинку правильной по размеру
                            fit: BoxFit.contain,
                            'assets/image/detail_page/empty_company_avatar_img.png'),
                        width: 109,
                        height: 161,
                      )),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 109,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      companies[index].name,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            );
          },
          itemCount: state.detailFilm.productionCompanies.length,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              width: 32,
            );
          },
        ),
      ));
}
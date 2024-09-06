import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/image_network_base_path.dart';
import '../../domain/models/detail_person_response/detail_person_response.dart';

personsListView(
    List<DetailPersonResponse> persons, int index, BuildContext context) {
  return Column(
    children: [
      ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CachedNetworkImage(
            useOldImageOnUrlChange: true,
            fit: BoxFit.cover,
            imageUrl:
                '${ImageNetworkBasePath.peopleImage}/${persons[index].profilePath}',
            errorWidget: (context, url, error) => Image.asset(
                fit: BoxFit.cover,
                persons[index].gender == 1
                    ? 'assets/image/detail_page/empty_girl_avatar_img.jpg'
                    : 'assets/image/detail_page/empty_man_avatar_img.jpg'),
            width: 109,
            height: 161,
          )),
      Container(
        alignment: Alignment.center,
        width: 109,
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            persons[index].name,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Colors.white),
          ),
        ),
      ),
      Visibility(
        visible: persons[index].character != null ? true : false,
        child: Container(
          alignment: Alignment.center,
          width: 109,
          child: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              persons[index].character != null
                  ? persons[index].character!
                  : '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ),
      )
    ],
  );
}

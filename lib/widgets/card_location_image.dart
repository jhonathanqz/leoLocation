import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:location_leo/style/app_colors.dart';
import 'package:location_leo/style/app_edgeinsets.dart';
import 'package:location_leo/style/app_size.dart';

class CardLocationImage extends StatelessWidget {
  const CardLocationImage({
    Key key,
    @required this.urlImage,
    @required this.onTap,
  }) : super(key: key);
  final String urlImage;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent.withOpacity(0.2),
        margin: AppEdgeInsets.minH,
        height: AppSize.heightCard,
        width: AppSize.widthCard,
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: CachedNetworkImage(
                  imageUrl: urlImage,
                  fit: BoxFit.fill,
                  placeholder: (context, urlImage) => Container(
                    height: AppSize.imageSize,
                    width: AppSize.imageSize,
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation(AppColors.greenInformation),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

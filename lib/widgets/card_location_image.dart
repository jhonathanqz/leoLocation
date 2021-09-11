import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
        margin: EdgeInsets.symmetric(horizontal: 5),
        height: 100,
        width: 200,
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: CachedNetworkImage(
                  imageUrl: urlImage,
                  fit: BoxFit.fill,
                  placeholder: (context, urlImage) => Container(
                    height: 40,
                    width: 40,
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.green),
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

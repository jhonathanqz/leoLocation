import 'package:flutter/material.dart';
import 'package:location_leo/style/app_colors.dart';
import 'package:location_leo/style/app_size.dart';

class Loading extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const Loading({
    Key key,
    @required this.isLoading,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      fit: StackFit.passthrough,
      children: [
        child,
        SizedBox(
          height: size.height,
          width: size.width,
          child: Visibility(
            visible: isLoading,
            child: Container(
              width: double.infinity,
              height: size.height,
              color: Colors.transparent.withOpacity(0.6),
              child: const Center(
                child: SizedBox(
                  height: AppSize.progressSize,
                  width: AppSize.progressSize,
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager_new/ui/utils/assets_utlis.dart';

class ScreenBackground extends StatelessWidget {
  final Widget child;
  const ScreenBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: SvgPicture.asset(
                AssetsUtils.backgroundSvg,
                fit: BoxFit.fill),
          ),
        ),
        SafeArea(child: child)
      ],
    );
  }
}
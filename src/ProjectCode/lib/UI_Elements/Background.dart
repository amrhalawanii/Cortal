import 'package:cortal/Helpers/Constants.dart';
import 'package:flutter/material.dart';

class BackgroundWithNoCard extends StatelessWidget {
  final Widget child;
  const BackgroundWithNoCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Device.height,
      width: Device.width,
      color: ConstantColors.accentGrey,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/registration/topLeft.png",
              height: Device.height! * 0.4,
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Image.asset("assets/registration/right.png",
                height: Device.height),
          ),
          child
        ],
      ),
    );
  }
}

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

class BackgroundWithLargeCard extends StatelessWidget {
  final Widget child;

  const BackgroundWithLargeCard({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        isPhone = constraints.maxWidth < kTabletBreakPoint;
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
                    height: Device.height!),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Container(
                    width: isPhone! ? Device.width! * 0.9 : Device.width! * 0.5,
                    height: Device.height! * 0.95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36.0),
                      color: const Color(0xffffffff),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x29000000),
                          offset: Offset(4, 4),
                          blurRadius: 15,
                        ),
                      ],
                    ),
                    child: child,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

import 'package:cortal/Helpers/Constants.dart';
import 'package:flutter/material.dart';

class MiddleLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: ConstantColors.primaryRed),
        ),
        Container(
            height: Device.height! * 0.9,
            width: 2,
            color: ConstantColors.primaryRed),
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: ConstantColors.primaryRed),
        ),
      ],
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: ConstantColors.navyBlue),
        ),
        Expanded(
          child: Container(
              // width: Device.height *0.9,
              height: 2,
              color: ConstantColors.navyBlue),
        ),
        Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: ConstantColors.navyBlue),
        ),
      ],
    );
  }
}

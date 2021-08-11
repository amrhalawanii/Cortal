import 'package:cortal/Helpers/Constants.dart';
import 'package:flutter/material.dart';

class ShowCircularProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      backgroundColor: ConstantColors.accentGrey,
      valueColor: new AlwaysStoppedAnimation<Color>(
        ConstantColors.primaryRed,
      ),
    ));
  }
}

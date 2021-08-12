import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class ShowMessage {
  //Error Dialogs
  showErrorDialog(BuildContext context, title, message) {
    AwesomeDialog(
            width: 500,
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.SCALE,
            headerAnimationLoop: false,
            title: title,
            desc: message,
            btnOkColor: Colors.red,
            btnOkOnPress: () {})
        .show();
  }
}

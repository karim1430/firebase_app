import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

AwesomeDialog awesomeDialogCustom(BuildContext context, String typeTitle,
    String description, DialogType dialogType,
    {void Function()? btnOkOnPress}) {
  return AwesomeDialog(
    context: context,
    dialogType: dialogType,
    animType: AnimType.rightSlide,
    title: typeTitle,
    desc: description,
    btnCancelOnPress: () {},
    btnOkOnPress: btnOkOnPress,
  );
}

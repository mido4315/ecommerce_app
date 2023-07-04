
import 'package:flutter/material.dart';

customDialogOnCash({
  required BuildContext context,
  required VoidCallback onOk,
  required String txtHead,
  required String txtMsg,
}) {

  Widget okButton = Center(child: TextButton(onPressed: onOk, child: const Text('Ok')));

  AlertDialog alertDialog = AlertDialog(
    title: Text(txtHead,textAlign: TextAlign.center,),
    alignment: Alignment.center,
    actions: [
      okButton,
    ],
  );


  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      });
}
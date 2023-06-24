import 'package:flutter/material.dart';

showAlertDialog(
    {required BuildContext context,
    required VoidCallback onOk,
    required String txtHead,
    required String txtMsg}) {
  Widget cancelButton = TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text('Cancel'));

  Widget okButton = TextButton(onPressed: onOk, child: const Text('Ok'));

  AlertDialog alertDialog = AlertDialog(
    title: Text(txtHead),
    content: Text(txtMsg),
    actions: [
      cancelButton,
      okButton,
    ],
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      });
}
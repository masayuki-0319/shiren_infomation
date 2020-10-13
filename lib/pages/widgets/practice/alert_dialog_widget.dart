import 'package:flutter/material.dart';

void showAlertDialog(BuildContext context) {

  Widget cancelButton = FlatButton(
    child: Text('キャンセル'),
    onPressed:  () {Navigator.pop(context);},
  );

  Widget continueButton = FlatButton(
    child: Text('続ける'),
    onPressed:  () {Navigator.pop(context);},
  );

  var alert = AlertDialog(
    title: Text('継続確認'),
    content: Text('このまま続けても大丈夫ですか?'),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

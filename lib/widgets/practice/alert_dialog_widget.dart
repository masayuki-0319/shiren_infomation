// [\[Flutter\] ダイアログの種類と使い分け方をカチッとまとめる \- Qiita](https://qiita.com/coka__01/items/4c1aea5fb1646e463f91)
// [flutter \- How to center the title of an appbar \- Stack Overflow](https://stackoverflow.com/questions/43981406/how-to-center-the-title-of-an-appbar)

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

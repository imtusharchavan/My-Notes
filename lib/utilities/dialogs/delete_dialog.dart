import 'package:flutter/material.dart';
import 'package:mynotes/utilities/dialogs/generic_dialog.dart';

Future<bool> showDeleteDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    content: 'Delete this note forever?',
    optionsBuilder: () => {
      'Cancle': false,
      'Delete': true,
    },
  ).then((value) => value ?? false);
}
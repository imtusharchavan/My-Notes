import 'package:flutter/material.dart';
import 'package:mynotes/utilities/dialogs/generic_dialog.dart';

Future<void> showCannotShareEmptyNoteDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    content: "Can't send empty note",
    optionsBuilder: () => {
      'OK': null,
    },
  );
}

import 'package:flutter/material.dart';
import 'package:mynotes/utilities/dialogs/generic_dialog.dart';

Future<void> showPasswordResetSentDialog(BuildContext context) {
  return showGenericDialog<void>(
    context: context,
    content: 'We have sent you an email with password reset link',
    optionsBuilder: () => {
      'OK': null,
    },
  );
}

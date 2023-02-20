import 'package:flutter/material.dart';

Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
        content: const Padding(
          padding: EdgeInsets.only(right: 32),
          child: Text('Are you sure you want to log out?'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text('Cancle', style: TextStyle(color: Colors.grey.shade800),),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text('Log out', style: TextStyle(color: Colors.grey.shade800),),
          ),
        ],
      );
    },
  ).then((value) => value ?? false);
}

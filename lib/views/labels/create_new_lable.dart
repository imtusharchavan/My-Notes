import 'package:flutter/material.dart';

class CreateNewLabel extends StatefulWidget {
  const CreateNewLabel({super.key});

  @override
  State<CreateNewLabel> createState() => _CreateNewLabelState();
}

class _CreateNewLabelState extends State<CreateNewLabel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit labels',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white10,
      ),
    );
  }
}
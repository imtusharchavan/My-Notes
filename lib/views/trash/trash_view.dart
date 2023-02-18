import 'package:flutter/material.dart';
import 'package:mynotes/components/nav_bar.dart';

class TrashView extends StatefulWidget {
  const TrashView({super.key});

  @override
  State<TrashView> createState() => _TrashViewState();
}

class _TrashViewState extends State<TrashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NabBar(),
      appBar: AppBar(
        title: const Text(
          'Trash',
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

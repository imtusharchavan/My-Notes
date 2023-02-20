import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NewNoteView extends StatefulWidget {
  const NewNoteView({super.key});

  @override
  State<NewNoteView> createState() => _NewNoteViewState();
}

class _NewNoteViewState extends State<NewNoteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.push_pin_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_alert_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.archive_outlined),
          ),
        ],
      ),
      body: const Text('Create new notes here...'),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mynotes/components/nav_bar.dart';

class RemindersView extends StatefulWidget {
  const RemindersView({super.key});

  @override
  State<RemindersView> createState() => _RemindersViewState();
}

class _RemindersViewState extends State<RemindersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NabBar(),
      appBar: AppBar(
        title: const Text(
          'Reminders',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white10,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.grid_view_outlined),
          ),
        ],
      ),
    );
  }
}

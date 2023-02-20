import 'package:flutter/material.dart';
import 'package:mynotes/components/nav_bar.dart';

class ArchiveView extends StatefulWidget {
  const ArchiveView({super.key});

  @override
  State<ArchiveView> createState() => _ArchiveViewState();
}

class _ArchiveViewState extends State<ArchiveView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NabBar(),
      appBar: AppBar(
        title: const Text(
          'Archive',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white10,
        actions: [
          IconButton(onPressed: () {
            
          }, icon: const Icon(Icons.search_outlined)),
          IconButton(onPressed: () {
            
          }, icon: const Icon(Icons.grid_view_outlined)),
        ],
      ),
    );
  }
}

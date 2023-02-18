import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';

class NabBar extends StatelessWidget {
  const NabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Text(
              'My Notes',
              style: TextStyle(fontSize: 20),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.lightbulb_outlined),
            title: const Text('Notes'),
            onTap: () {
              Navigator.of(context).pushNamed(notesRoute);
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: const Text('Reminders'),
            onTap: () {
              Navigator.of(context).pushNamed(remindersRoute);
            },
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Create new label'),
            onTap: () {
              Navigator.of(context).pushNamed(createNewLabelRoute);
            },
          ),
          ListTile(
            leading: const Icon(Icons.archive_outlined),
            title: const Text('Archive'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.delete_outlined),
            title: const Text('Trash'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Settings'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

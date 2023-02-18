import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/services/auth/auth_service.dart';
import 'package:mynotes/utilities/logout_dialog.dart';

class NabBar extends StatelessWidget {
  const NabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 120,
            child: DrawerHeader(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'My Notes',
                  style: TextStyle(fontSize: 20),
                ),
              ),
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
            onTap: () {
              Navigator.of(context).pushNamed(archiveRoute);
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete_outlined),
            title: const Text('Trash'),
            onTap: () {
              Navigator.of(context).pushNamed(trashRoute);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Settings'),
            onTap: () {
              Navigator.of(context).pushNamed(settingsRoute);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text('Log out'),
            onTap: () async {
              final shouldLogout = await showLogOutDialog(context);
                  if (shouldLogout) {
                    await AuthService.firebase().logOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      loginRoute,
                      (_) => false,
                    );
                  }
            },
          ),
        ],
      ),
    );
  }
}

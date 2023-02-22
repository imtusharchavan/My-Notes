import 'package:flutter/material.dart';
import 'package:mynotes/components/nav_bar.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/enums/menu_action.dart';
import 'package:mynotes/services/auth/auth_service.dart';
import 'package:mynotes/services/crud/notes_service.dart';
import 'package:mynotes/utilities/dialogs/logout_dialog.dart';
import 'package:mynotes/views/notes/notes_list_view.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  late final NotesService _notesService;
  String get userEmail => AuthService.firebase().currentUser!.email!;

  @override
  void initState() {
    _notesService = NotesService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NabBar(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        title: const Text(
          'Notes',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.grid_view_outlined)),
          PopupMenuButton<MenuAction>(
            onSelected: (value) async {
              switch (value) {
                case MenuAction.logout:
                  final shouldLogout = await showLogOutDialog(context);
                  if (shouldLogout) {
                    await AuthService.firebase().logOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      loginRoute,
                      (_) => false,
                    );
                  }
              }
            },
            itemBuilder: (context) {
              return const [
                PopupMenuItem<MenuAction>(
                  value: MenuAction.logout,
                  child: Text('Log out'),
                ),
              ];
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: _notesService.getOrCreateUser(email: userEmail),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return StreamBuilder(
                stream: _notesService.allNotes,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    case ConnectionState.active:
                      if (snapshot.hasData) {
                        final allNotes = snapshot.data as List<DatabaseNote>;
                        return NotesListView(
                          notes: allNotes,
                          onDeleteNote: (note) async {
                            await _notesService.deleteNote(id: note.id);
                          },
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    default:
                      return const CircularProgressIndicator();
                  }
                },
              );
            default:
              return const CircularProgressIndicator();
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(newNoteRoute);
        },
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(18))),
        backgroundColor: Colors.grey.shade200,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 4,
        shape: const AutomaticNotchedShape(
          RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(18))),
        ),
        color: Colors.grey.shade200,
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.check_box_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.brush_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.mic_none_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.insert_photo_outlined),
            ),
          ],
        ),
      ),
    );
  }
}

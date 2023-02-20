import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/services/auth/auth_service.dart';
import 'package:mynotes/views/archive/archive_view.dart';
import 'package:mynotes/views/auth/login_view.dart';
import 'package:mynotes/views/labels/create_new_lable.dart';
import 'package:mynotes/views/notes/new_note_view.dart';
import 'package:mynotes/views/notes/notes_view.dart';
import 'package:mynotes/views/auth/register_view.dart';
import 'package:mynotes/views/auth/verify_email_view.dart';
import 'package:mynotes/views/reminders/reminders_view.dart';
import 'package:mynotes/views/settings/settings_view.dart';
import 'package:mynotes/views/trash/trash_view.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized;
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: 'OpenSans',
        dividerColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.grey.shade800),
        hintColor: Colors.grey,
      ),
      home: const HomePage(),
      routes: {
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        notesRoute: (context) => const NotesView(),
        newNoteRoute:(context) => const NewNoteView(),
        verifyEmailRoute: (context) => const VerifyEmailView(),
        remindersRoute:(context) => const RemindersView(),
        createNewLabelRoute:(context) => const CreateNewLabel(),
        archiveRoute:(context) => const ArchiveView(),
        trashRoute:(context) => const TrashView(),
        settingsRoute:(context) => const SettingsView(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              if (user.isEmailVerified) {
                return const NotesView();
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const LoginView();
            }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}

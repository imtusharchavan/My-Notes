import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/services/auth/bloc/auth_bloc.dart';
import 'package:mynotes/services/auth/bloc/auth_event.dart';
import 'package:mynotes/services/auth/bloc/auth_state.dart';
import 'package:mynotes/services/auth/firebase_auth_provider.dart';
import 'package:mynotes/views/archive/archive_view.dart';
import 'package:mynotes/views/auth/login_view.dart';
import 'package:mynotes/views/labels/create_new_lable.dart';
import 'package:mynotes/views/notes/create_update_note_view.dart';
import 'package:mynotes/views/notes/notes_view.dart';
import 'package:mynotes/views/auth/register_view.dart';
import 'package:mynotes/views/auth/verify_email_view.dart';
import 'package:mynotes/views/reminders/reminders_view.dart';
import 'package:mynotes/views/settings/settings_view.dart';
import 'package:mynotes/views/trash/trash_view.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white70,
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
      home: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(FirebaseAuthProvider()),
        child: const HomePage(),
      ),
      routes: {
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        notesRoute: (context) => const NotesView(),
        createUpdateNoteRoute: (context) => const CreateUpdateNoteView(),
        verifyEmailRoute: (context) => const VerifyEmailView(),
        remindersRoute: (context) => const RemindersView(),
        createNewLabelRoute: (context) => const CreateNewLabel(),
        archiveRoute: (context) => const ArchiveView(),
        trashRoute: (context) => const TrashView(),
        settingsRoute: (context) => const SettingsView(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(const AuthEventInitialize());
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthStateLoggedIn) {
          return const NotesView();
        } else if (state is AuthStateNeedsVerification) {
          return const VerifyEmailView();
        } else if (state is AuthStateLoggedOut) {
          return const LoginView();
        } else {
          return const Scaffold(
            body: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

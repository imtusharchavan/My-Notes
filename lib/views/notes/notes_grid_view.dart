import 'package:flutter/material.dart';
import 'package:mynotes/services/cloud/cloud_note.dart';
import 'package:mynotes/utilities/dialogs/delete_dialog.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

typedef NoteCallBack = void Function(CloudNote note);

class NotesGridView extends StatelessWidget {
  final Iterable<CloudNote> notes;
  final NoteCallBack onDeleteNote;
  final NoteCallBack onTap;

  const NotesGridView({
    super.key,
    required this.notes,
    required this.onDeleteNote,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(5.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes.elementAt(index);
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            onTap: () {
              onTap(note);
            },
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(12),
            ),
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                note.text,
                maxLines: 10,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 14,
                ),
              ),
            ),
            // trailing: IconButton(
            //   onPressed: () async {
            //     final shouldDelete = await showDeleteDialog(context);
            //     if (shouldDelete) {
            //       onDeleteNote(note);
            //     }
            //   },
            //   icon: const Icon(Icons.delete),
            // ),
          ),
        );
      },
    );
  }
}

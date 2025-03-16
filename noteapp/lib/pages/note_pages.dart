import 'package:flutter/material.dart';
import 'package:noteapp/models/note.dart';
import 'package:noteapp/models/note_database.dart';
import 'package:provider/provider.dart';

class NoteApp extends StatefulWidget {
  const NoteApp({super.key});

  @override
  State<NoteApp> createState() => _NoteAppState();
}

class _NoteAppState extends State<NoteApp> {
  // text controller
  final textController = TextEditingController();
  
  get selectedNoteId => null;

  //   create a list of notes
  void createNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              // add to the data base
              context.read<NoteDatabase>().addNote(textController.text as Note);

              // pop the dialog
              Navigator.pop(context);
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  // read note
  void readNote() {
    final notes = context.read<NoteDatabase>().getAllNotes();
    // You can use the notes variable to display the notes in the UI
  }

  // update note
  void updateNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              // update the note in the database
              context.read<NoteDatabase>().updateNote(
                    Note(
                      id: selectedNoteId, // You need to define selectedNoteId
                      content: textController.text,
                    ),
                  );

              // pop the dialog
              Navigator.pop(context);
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }

  // delete note
  void deleteNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('Are you sure you want to delete this note?'),
        actions: [
          MaterialButton(
            onPressed: () {
              // delete the note from the database
              context.read<NoteDatabase>().deleteNote(
                    selectedNoteId, // You need to define selectedNoteId
                  );

              // pop the dialog
              Navigator.pop(context);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Notes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: const Icon(Icons.add),
      ),
    );
  }
}

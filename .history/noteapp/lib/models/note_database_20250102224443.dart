import 'package:isar/isar.dart';
import 'package:noteapp/models/note.dart';
import "package:path_provider/path_provider.dart";


class NoteDatabase {

  static late Isar isar;
  // initiate the database

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      directory: dir.path,
      [NoteSchema],
    );
  }

// list of notes

final notes = isar.notes.watch();
  // create a new note



  // update a note




  // delete a note
}
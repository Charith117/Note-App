import 'package:isar/isar.dart';
import "package:path_provider/path_provider.dart";


class NoteDatabase {

  static late Isar isar;
  // initiate the database

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      directory: dir.path,
      schema: [NoteSchema],
    );
  }



  // create a new note



  // update a note




  // delete a note
}
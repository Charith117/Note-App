import 'package:isar/isar.dart';
import 'package:noteapp/models/note.dart';
import 'package:path_provider/path_provider.dart';

/// A class that manages the Isar database for storing and retrieving notes.
class NoteDatabase {
  late Isar _isar;

  static var instance;

  /// Initializes the Isar database.
  ///
  /// This method should be called before performing any database operations.
  /// It sets up the database directory and opens the Isar instance with the
  /// specified schema.
  Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [NoteSchema],
      directory: dir.path,
    );
  }

  /// Adds a new note to the database.
  ///
  /// Takes a [Note] object as a parameter and writes it to the database
  /// within a transaction.
  Future<void> addNote(Note note) async {
    await _isar.writeTxn(() async {
      await _isar.notes.put(note);
    });
  }

  /// Retrieves all notes from the database.
  ///
  /// Returns a [Future] that resolves to a list of [Note] objects.
  Future<List<Note>> getAllNotes() async {
    return await _isar.notes.where().findAll();
  }

  /// Updates an existing note in the database.
  ///
  /// Takes a [Note] object as a parameter and updates it in the database
  /// within a transaction.
  Future<void> updateNote(Note note) async {
    await _isar.writeTxn(() async {
      await _isar.notes.put(note);
    });
  }

  /// Deletes a note from the database by its ID.
  ///
  /// Takes an integer [id] as a parameter and deletes the corresponding note
  /// within a transaction.
  Future<void> deleteNoteById(int id) async {
    await _isar.writeTxn(() async {
      await _isar.notes.delete(id);
    });
  }

  /// Closes the Isar database.
  ///
  /// This method should be called when the database is no longer needed to
  /// release resources.
  Future<void> close() async {
    await _isar.close();
  }
}

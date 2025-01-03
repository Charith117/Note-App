import "pakages:isar/isar.dart";




class NOte {


  Id id = Isar.awaite isar.notes.put(Note(
    title: "Hello",
    content: "World",
    created: DateTime.now(),
  ));
}

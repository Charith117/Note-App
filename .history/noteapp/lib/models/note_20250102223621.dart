import "package:isar/isar.dart";


part 'note.g.dart';


@
class Note {


  Id id = Isar.autoIncrement;
  late String text;
}

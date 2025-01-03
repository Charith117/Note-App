import "package:isar/isar.dart";


part 'note.g.dart';


@Co
class Note {


  Id id = Isar.autoIncrement;
  late String text;
}

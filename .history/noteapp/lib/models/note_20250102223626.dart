import "package:isar/isar.dart";


part 'note.g.dart';


@Collectio
class Note {


  Id id = Isar.autoIncrement;
  late String text;
}

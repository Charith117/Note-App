import "package:isar/isar.dart";


part 'note.g.dart';


@Collectioo
class Note {


  Id id = Isar.autoIncrement;
  late String text;
}

import 'package:hive/hive.dart';
part 'notes_model.g.dart'; //same name of model to generate type adapter
//command to auto generate : flutter packages pub run build_runner build

@HiveType(typeId: 0) //each class has different id
class NotesModel extends HiveObject {
  @HiveField(0) // unique per class
  String title;
  @HiveField(1)
  String content;
  @HiveField(2)
  // here i didn't use DateTime as it is object and hive can't store object
  // except if i create a type adapter for each object
  final String date;
  @HiveField(3)
  // same here i can't use type color
  int color;

  NotesModel({
    required this.title,
    required this.content,
    required this.date,
    required this.color,
  });
}

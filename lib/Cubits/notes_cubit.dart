import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import '../Models/notes_model.dart';
import '../constants.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NotesModel>? notes;
  fetchAllNotes() {
    // no loading state here as this is getter so there isn't future
    var notesBox = Hive.box<NotesModel>(kNotesBox);
    notes = notesBox.values.toList();
    emit(NotesSuccess());
    // await notesBox.add(notes);
  }
}

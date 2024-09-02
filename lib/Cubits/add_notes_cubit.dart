import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/Models/notes_model.dart';
import 'package:notes_app/constants.dart';

part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());

  Color noteColor = const Color(0xff9e0142);

  addNote(NotesModel notes) async {
    notes.color = noteColor.value;
    emit(AddNotesLoading());
    try {
      var notesBox = Hive.box<NotesModel>(kNotesBox);
      emit(AddNotesSuccess());
      await notesBox.add(notes);
    } catch (e) {
      emit(AddNotesFailure(e.toString()));
    }
  }
}

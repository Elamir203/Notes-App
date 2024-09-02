import 'package:flutter/material.dart';
import 'package:notes_app/Models/notes_model.dart';
import 'package:notes_app/Widgets/edit_view_body.dart';

class EditNotesView extends StatelessWidget {
  const EditNotesView({super.key, required this.notesModel});

  final NotesModel notesModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditViewBody(
        notesModel: notesModel,
      ),
    );
  }
}

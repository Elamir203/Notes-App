import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/Cubits/notes_cubit.dart';
import 'package:notes_app/Models/notes_model.dart';
import 'package:notes_app/Views/edit_notes_view.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key, required this.notesModel});

  final NotesModel notesModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return EditNotesView(
              notesModel: notesModel,
            );
          }),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(left: 12, top: 24, bottom: 24),
        decoration: BoxDecoration(
          color: Color(notesModel.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                notesModel.title,
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                  //fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Text(
                  notesModel.content,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(0.5),
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  notesModel.delete();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                },
                icon: const Icon(
                  FontAwesomeIcons.trash,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text(
                notesModel.date,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

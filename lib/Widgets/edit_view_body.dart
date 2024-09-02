import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Cubits/notes_cubit.dart';
import 'package:notes_app/Models/notes_model.dart';
import 'package:notes_app/Widgets/custom_app_bar.dart';
import 'package:notes_app/Widgets/custom_text_form_field.dart';

import 'edit_notes_colors_list_view.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({super.key, required this.notesModel});

  final NotesModel notesModel;

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 55,
          ),
          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
            onPressed: () {
              widget.notesModel.title = title ?? widget.notesModel.title;
              widget.notesModel.content = content ?? widget.notesModel.content;
              widget.notesModel.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 51,
          ),
          CustomTextFormField(
              onChanged: (value) {
                title = value;
              },
              hintText: widget.notesModel.title),
          const SizedBox(
            height: 24,
          ),
          CustomTextFormField(
            onChanged: (value) {
              content = value;
            },
            hintText: widget.notesModel.content,
            maxLines: 5,
          ),
          const SizedBox(
            height: 24,
          ),
          EditNotesColorsListView(notesModel: widget.notesModel),
        ],
      ),
    );
  }
}

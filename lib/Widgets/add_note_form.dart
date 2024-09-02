import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/Cubits/add_notes_cubit.dart';
import 'package:notes_app/Models/notes_model.dart';
import 'package:notes_app/Widgets/colors_list_view.dart';
import 'custom_button.dart';
import 'custom_text_form_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextFormField(
            hintText: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 24,
          ),
          CustomTextFormField(
            hintText: 'Content',
            maxLines: 5,
            onSaved: (value) {
              content = value;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const ColorsListView(),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<AddNotesCubit, AddNotesState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNotesLoading ? true : false,
                onTap: () {
                  DateTime now = DateTime.now();
                  String formattedDate = DateFormat('dd-MM-yyyy').format(now);
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var notesModel = NotesModel(
                        title: title!,
                        content: content!,
                        date: formattedDate,
                        color: Colors.white.value);
                    BlocProvider.of<AddNotesCubit>(context).addNote(notesModel);
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}

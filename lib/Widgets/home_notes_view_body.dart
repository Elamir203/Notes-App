import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Cubits/notes_cubit.dart';
import 'package:notes_app/Widgets/custom_app_bar.dart';
import 'notes_list_view_builder.dart';

class HomeNotesViewBody extends StatefulWidget {
  const HomeNotesViewBody({super.key});

  @override
  State<HomeNotesViewBody> createState() => _HomeNotesViewBodyState();
}

class _HomeNotesViewBodyState extends State<HomeNotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          SizedBox(
            height: 55,
          ),
          CustomAppBar(
            title: 'Notes',
          ),
          //SizedBox(height: 10,),
          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}

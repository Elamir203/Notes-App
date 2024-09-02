import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/home_notes_view_body.dart';
import '../Widgets/add_note_in_bottom_sheet.dart';

class HomeNotesView extends StatelessWidget {
  const HomeNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return const AddNoteInBottomSheet();
                });
          },
          backgroundColor: Colors.cyan,
          child: const Icon(Icons.add),
        ),
        body: const HomeNotesViewBody());
  }
}

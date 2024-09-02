import 'package:flutter/material.dart';

import '../Models/notes_model.dart';
import '../constants.dart';
import 'colors_list_view.dart';

class EditNotesColorsListView extends StatefulWidget {
  const EditNotesColorsListView({super.key, required this.notesModel});

  final NotesModel notesModel;
  @override
  State<EditNotesColorsListView> createState() =>
      _EditNotesColorsListViewState();
}

class _EditNotesColorsListViewState extends State<EditNotesColorsListView> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = kNotesColors.indexOf(Color(widget.notesModel.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: kNotesColors.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: GestureDetector(
                  onTap: () {
                    currentIndex = index;
                    widget.notesModel.color = kNotesColors[index].value;
                    setState(() {});
                  },
                  child: ColorsItem(
                    color: kNotesColors[index],
                    isColorChosen: currentIndex == index,
                  )),
            );
          }),
    );
  }
}

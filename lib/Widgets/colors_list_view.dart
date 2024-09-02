import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Cubits/add_notes_cubit.dart';
import 'package:notes_app/constants.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;

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
                    BlocProvider.of<AddNotesCubit>(context).noteColor =
                        kNotesColors[index];
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

class ColorsItem extends StatelessWidget {
  const ColorsItem(
      {super.key, required this.isColorChosen, required this.color});
  final bool isColorChosen;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isColorChosen
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 28,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 24,
            ),
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 28,
          );
  }
}

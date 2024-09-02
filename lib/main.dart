import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/Views/home_notes_view.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'Cubits/notes_cubit.dart';
import 'Models/notes_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NotesModelAdapter()); // must register before open box
  await Hive.openBox<NotesModel>(kNotesBox);
  Bloc.observer = SimpleBlocObserver();
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        home: const HomeNotesView(),
      ),
    );
  }
}

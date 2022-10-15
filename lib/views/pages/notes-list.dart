import 'package:flutter/material.dart';
import 'package:io_karolbryzgiel_flutter/dto/note-dto.dart';
import 'package:io_karolbryzgiel_flutter/model/note.dart';

List<Note> generateNotes(List<NoteDto>? noteList) {
  return List<Note>.from(noteList!.map((model) =>
      Note(
        headerValue: model.comment,
        expandedValue: model.comment
      ),
  ),
  );
}

class NoteList extends StatefulWidget {
  final List<NoteDto>? noteList;

  const NoteList({Key? key, required this.noteList}) : super(key: key);

  @override
  State<NoteList> createState() => _NoteListState(data: generateNotes(noteList));
}

class _NoteListState extends State<NoteList> {
  List<Note> data;
  // List<NoteDto>? noteList;

  _NoteListState({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista notatek'),
        ),
        body: ListView(
            children: [
              ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    data[index].isExpanded = !isExpanded;
                  });
                },
                children: data.map<ExpansionPanel>((Note note) {
                  return ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text(note.headerValue),
                      );
                    },
                    body: ListTile(
                        title: Text(note.expandedValue),
                        trailing: const Icon(Icons.delete),
                        onTap: () {
                          setState(() {
                            data.removeWhere((Note currentNote) => note == currentNote);
                          });
                        }),
                    isExpanded: note.isExpanded,
                  );
                }).toList(),
              ),
            ]
        )
    );
  }
}

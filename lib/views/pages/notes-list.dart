import 'package:flutter/material.dart';
import 'package:io_karolbryzgiel_flutter/model/note.dart';

List<Note> generateNotes(int numberOfNotes) {
  return List<Note>.generate(numberOfNotes, (int index) {
    return Note(
      headerValue: 'Panel $index',
      expandedValue: 'Długi text dla notatki numer $index',
    );
  });
}

class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  final List<Note> _data = generateNotes(8);
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
                  _data[index].isExpanded = !isExpanded;
                });
              },
              children: _data.map<ExpansionPanel>((Note note) {
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
                          _data.removeWhere((Note currentNote) => note == currentNote);
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

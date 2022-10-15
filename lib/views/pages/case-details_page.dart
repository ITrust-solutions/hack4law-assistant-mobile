import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:io_karolbryzgiel_flutter/model/case.dart';
import 'package:io_karolbryzgiel_flutter/views/pages/notes-list.dart';
import 'package:io_karolbryzgiel_flutter/views/widgets/reusable_card.dart';

import '../../commons/constants.dart';
import '../widgets/icon_popup_menu_item.dart';

enum Menu { itemOne, itemTwo, itemThree, itemFour }

class CaseDetails extends StatefulWidget {
  final Case case_s;

  const CaseDetails({Key? key, required this.case_s}) : super(key: key);

  @override
  State<CaseDetails> createState() => _CaseDetailsState(case_s: case_s);
}

class _CaseDetailsState extends State<CaseDetails> {
  String _selectedMenu = '';
  Case case_s;

  _CaseDetailsState({required this.case_s});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Szczegóły sprawy"),
        actions: <Widget>[
          // This button presents popup menu items.
          PopupMenuButton<Menu>(
            // Callback that sets the selected popup menu item.
              onSelected: (Menu item) {
                setState(() {
                  _selectedMenu = item.name;
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                PopupMenuItem<Menu>(
                  value: Menu.itemOne,
                  child: IconPopupMenuItem(
                      function: () {
                        print('a');
                      },
                      icon: Icons.attach_file,
                      text: 'Dodaj załącznik'),
                ),
                PopupMenuItem<Menu>(
                  value: Menu.itemTwo,
                  child: IconPopupMenuItem(
                      function: () {
                        print('a');
                      },
                      icon: Icons.note_add_outlined,
                      text: 'Dodaj notatkę'),
                ),
              ]),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.center,
            child: Text(
              "Numer sprawy: ${case_s.caseNumber}",
              style: kMediumLabelTextStyle,
            ),
          ),
          Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.center,
              child: Chip(
                backgroundColor: kBottomContainerColor,
                label: Text(case_s.caseStatus!),
                labelStyle: kWhiteLabelTextStyle,
              )
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Data wpływu: ${DateFormat('yyyy-MM-dd kk:mm').format(case_s.receiptDate!)}" ,
            ),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Termin wykonania: ${DateFormat('yyyy-MM-dd kk:mm').format(case_s.receiptDate!)}" ,
            ),
          ),
          ReusableCard(function: () {
            _openNoteList(case_s);
          },
              leadingIcon: Icon(Icons.note_outlined),
              trailingIcon: Icon(Icons.arrow_forward),
              text: "Pokaż wszystkie notatki"),
          ReusableCard(function: () {},
              leadingIcon: Icon(Icons.attach_file),
              trailingIcon: Icon(Icons.arrow_forward),
              text: "Pokaż wszystkie załączniki")
        ],
      ),
    );
  }

  void _openNoteList(Case case_s) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => NoteList(
          noteList: case_s.notesList,
        ))
    );
  }
}
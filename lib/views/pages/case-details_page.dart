import 'package:flutter/material.dart';
import 'package:io_karolbryzgiel_flutter/views/pages/notes-list.dart';
import 'package:io_karolbryzgiel_flutter/views/widgets/reusable_card.dart';

import '../../commons/constants.dart';
import '../widgets/icon_popup_menu_item.dart';

enum Menu { itemOne, itemTwo, itemThree, itemFour }

class CaseDetails extends StatefulWidget {
  final String caseId;

  const CaseDetails({Key? key, required this.caseId}) : super(key: key);

  @override
  State<CaseDetails> createState() => _CaseDetailsState(caseId: caseId);
}

class _CaseDetailsState extends State<CaseDetails> {
  String _selectedMenu = '';
  String caseId;

  _CaseDetailsState({required this.caseId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Szczegóły sprawy $caseId"),
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
              "Sprawa: XIV/15/2022",
              style: kMediumLabelTextStyle,
            ),
          ),
          Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.center,
              child: const Chip(
                backgroundColor: kBottomContainerColor,
                label: Text('W TOKU'),
                labelStyle: kWhiteLabelTextStyle,
              )
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Data wpływu: 26 paź, 2022 15:40" ,
            ),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Deadline: 26 paź, 2022 15:40" ,
            ),
          ),
          ReusableCard(function: () {
            _openNoteList();
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

  void _openNoteList() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => NoteList(
        ))
    );
  }
}
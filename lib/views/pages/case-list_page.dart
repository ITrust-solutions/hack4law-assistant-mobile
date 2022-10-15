import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:io_karolbryzgiel_flutter/views/pages/case-details_page.dart';

class CaseList extends StatefulWidget {
  const CaseList({super.key});

  @override
  State<CaseList> createState() => _CaseListState();
}

class _CaseListState extends State<CaseList> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista spraw'),
      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemBuilder: /*1*/ (context, i) {
              if (i.isOdd) return const Divider();

              final index = i ~/ 2; /*3*/
              if (index >= _suggestions.length) {
                _suggestions.addAll(generateWordPairs().take(10));
              }
              return ListTile(
                title: Text(
                  _suggestions[index].asPascalCase,
                  style: _biggerFont,
                ),
                subtitle: const Text(
                    "Data wpływu: 16.02.02"
                ),
                onTap: () {
                  this._openCase();
                },
                trailing: const Icon(Icons.arrow_forward),
              );
            },
          ),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.qr_code_2_outlined,
              size: 24.0,
            ),
            label: const Text('Otwórz sprawę w aplikacji'),
          ),
        ],
      ),
    );
  }

  void _openCase() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => CaseDetails(
          caseId: "test",
        ))
    );
  }
}
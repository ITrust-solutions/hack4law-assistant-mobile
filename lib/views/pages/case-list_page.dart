import 'package:flutter/material.dart';
import 'package:io_karolbryzgiel_flutter/model/case.dart';
import 'package:io_karolbryzgiel_flutter/services/case-service.dart';
import 'package:io_karolbryzgiel_flutter/views/pages/case-details_page.dart';

import 'qr-code-scanner_page.dart';

class CaseList extends StatefulWidget {
  const CaseList({super.key});

  @override
  State<CaseList> createState() => _CaseListState();
}

class _CaseListState extends State<CaseList> {
  late Future<List<Case>> caseList;
  final caseService = CaseService();
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista spraw'),
      ),
      body: Column(
        children: [
          Expanded(child: FutureBuilder<List<Case>>(
              future: caseService.fetchAllCases(),
              builder: (context, future) {
                if (!future.hasData) {
                  return Container(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: const Text('Brak przypisanych spraw.'),);
                } else {
                  List<Case> list = future.data!;
                  return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            list[index].caseNumber,
                            style: _biggerFont,
                          ),
                          subtitle: Text(
                              list[index].receiptDate.toString()
                          ),
                          onTap: () {
                            this._openCase(list[index]);
                          },
                          trailing: const Icon(Icons.arrow_forward),
                        );
                        // return Container(child: Text(list[index].caseNumber));
                      });
                }
              }),
          ),
          Center(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Scanner(),
                ));
              },
              icon: const Icon(
                Icons.qr_code_2_outlined,
                size: 24.0,
              ),
              label: const Text('Otwórz sprawę w aplikacji'),
            ),
          ),
        ],
      ),
    );
  }

  void _openCase(Case case_s) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => CaseDetails(
          case_s: case_s,
        ))
    );
  }
}
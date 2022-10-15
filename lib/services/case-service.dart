
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:io_karolbryzgiel_flutter/model/case.dart';
class CaseService {

    Future<List<Case>> fetchAllCases() async {
      final response = await http
          .get(Uri.parse('https://hack4law-assistant-service.wittysea-0637102a.westeurope.azurecontainerapps.io/api/assistant/cases/findAllCases'));

      if (response.statusCode == 200) {
        Iterable cases = json.decode(response.body);
        var list = List<Case>.from(cases.map((model) => Case.fromJson(model)));
        return list;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load cases ${response.body}');
      }
  }
}
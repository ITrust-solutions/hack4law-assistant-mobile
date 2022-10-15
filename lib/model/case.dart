import 'package:io_karolbryzgiel_flutter/dto/note-dto.dart';

class Case {
  final int id;
  final String caseNumber;
  final String description;
  DateTime? receiptDate;
  DateTime? deadlineDate;
  String? caseStatus;
  String? assignedUser;
  String? helpingUser;
  List<NoteDto>? notesList;

  Case({
    required this.id,
    required this.caseNumber,
    required this.description,
    this.receiptDate,
    this.deadlineDate,
    this.caseStatus,
    this.assignedUser,
    this.helpingUser,
    this.notesList,
  });

  factory Case.fromJson(Map<String, dynamic> json) {
    return Case(
      id: json['id'],
      caseNumber: json['caseNumber'],
      receiptDate: json['receiptDate'] != null ? DateTime.parse(json['receiptDate']) : null,
      deadlineDate: json['receiptDate'] != null ? DateTime.parse(json['deadlineDate']) : null,
      description: json['description'],
      caseStatus: json['caseStatus'],
      assignedUser: json['assignedUser'],
      helpingUser: json['helpingUser'],
      notesList: List<NoteDto>.from(json['notesList'].map((model) => NoteDto.fromJson(model)))
    );
  }
}
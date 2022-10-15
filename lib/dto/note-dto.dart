class NoteDto {
  final String comment;

  NoteDto({
    required this.comment,
  });

  factory NoteDto.fromJson(Map<String, dynamic> json) {
    return NoteDto(
      comment: json['comment'],
    );
  }
}
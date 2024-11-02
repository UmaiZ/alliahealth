class Option {
  final int id;
  final String option;
  final bool isFreeForm;
  final int questionId;

  Option({
    required this.id,
    required this.option,
    required this.isFreeForm,
    required this.questionId,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      id: json['id'],
      option: json['option'],
      isFreeForm: json['isFreeForm'],
      questionId: json['questionId'],
    );
  }
}

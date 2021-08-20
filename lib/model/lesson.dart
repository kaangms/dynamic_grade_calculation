class Lesson {
  final String name;
  final double letterNote;
  final double credit;

  Lesson({required this.name, required this.letterNote, required this.credit});

  String CheckValueforPrintf() {
    return '$name -$letterNote- $credit';
  }
}

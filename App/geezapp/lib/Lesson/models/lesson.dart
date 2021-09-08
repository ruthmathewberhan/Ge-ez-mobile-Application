class Lesson {
  final int lesson_id;
  final String lessonName;
  final int level_id;
  final int course_id;
  final String content;
  final String status;
  final int teacher_id;
  final String teacher_name;
  
  Lesson(
      {required this.lesson_id,
      required this.lessonName,
      required this.level_id,
      required this.course_id,
      required this.content,
      required this.status,
      required this.teacher_id,
      required this.teacher_name});

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
        lesson_id: json['lesson_id'],
        lessonName: json['lessonName'],
        level_id: json['level_id'],
        course_id: json['course_id'],
        content: json['content'],
        status: json['status'],
        teacher_id: json['teacher_id'],
        teacher_name: json['teacher_name']);
  }
}
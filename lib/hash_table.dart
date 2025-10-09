// String? studentSearch(List<Student?> StudentList, int studentId){
//   return StudentList[studentId]?.name;
// }

class Student{
  final int id;
  final String name;

  Student(this.id, this.name);

  @override
  String toString() => '[$id] $name';
  
}

class HashTable {
  final _bucket = List<List<Student?>>.generate(100, (_) => []);

  void insert(Student student) {
    final index = _hash(student.id);
    _bucket[index].add(student);
  }

  int _hash(int studentId){
    return studentId % 100;
  }

  Student? getStudent(int studentId){
    final index = _hash(studentId);
    final studentsAtIndex = _bucket[index];
    for (final student in studentsAtIndex){
      if (student.id == studentId){
        return student;
      }
    }
    return null;
  }
}

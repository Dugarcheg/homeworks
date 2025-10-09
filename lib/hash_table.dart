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
  final _bucket = List<Student?>.filled(100, null);

  void insert(Student student) {
    final index = _hash(student.id);
    _bucket[index] = student;
  }

  int _hash(int studentId){
    return studentId % 100;
  }

  Student? getStudent(int studentId){
    final index = _hash(studentId);
    return _bucket[index];
  }
}

String? studentSearch(List<Student?> StudentList, int studentId){
  return StudentList[studentId]?.name;
}

class Student{
  final int id;
  final String name;

  Student(this.id, this.name);
}
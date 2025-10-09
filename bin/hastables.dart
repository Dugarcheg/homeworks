import 'package:hastables/binary_search.dart';
import 'package:hastables/hash_table.dart';
import 'package:hastables/linear_search.dart';

void main() {
  final myList = [42, 3, 10, 7, 28, 149, 0, 3, 25, 7, 1];
  var foundIndex = linearSearch(myList, 28);
  print(foundIndex);

  myList.sort();
  print(myList);

  foundIndex = binarySearch(myList, 149);
  print(foundIndex);


  // final studentList = List<Student?>.filled(3000000, null);
  final students = HashTable();
  students.insert(Student(2024078, 'AZ1'));
  students.insert(Student(2024077, 'AZ2'));
  students.insert(Student(2021018, 'AD'));
  students.insert(Student(2023139, 'BB'));
  students.insert(Student(2025068, 'BS'));
  students.insert(Student(2024008, 'DD'));
  students.insert(Student(2024095, 'ES1'));
  students.insert(Student(2024012, 'ED1'));
  students.insert(Student(2024054, 'EB'));
  students.insert(Student(2024081, 'ED2'));
  students.insert(Student(2024111, 'ES2'));
  students.insert(Student(2024059, 'MI'));
  students.insert(Student(2024025, 'MB'));
  students.insert(Student(2024020, 'MC'));
  students.insert(Student(2023002, 'NM'));
  students.insert(Student(2022081, 'TG'));
  students.insert(Student(2024085, 'TK'));
  students.insert(Student(2023096, 'TA'));
  students.insert(Student(2022007, 'UM'));
  students.insert(Student(2024007, 'VG'));

  final studentName = students.getStudent(2022007);
  print(studentName);
}

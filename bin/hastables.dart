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


  // studentList[2024078] = Student(2024078, 'AZ1');
  // studentList[2024077] = Student(2024077, 'AZ2');
  // studentList[2021018] = Student(2021018, 'AD');
  // studentList[2023139] = Student(2023139, 'BB');
  // studentList[2025068] = Student(2025068, 'BS');
  // studentList[2024008] = Student(2024008, 'DD');
  // studentList[2024095] = Student(2024095, 'ES1');
  // studentList[2024012] = Student(2024012, 'ED1');
  // studentList[2024054] = Student(2024054, 'EB');
  // studentList[2024081] = Student(2024081, 'ED2');
  // studentList[2024111] = Student(2024111, 'ES2');
  // studentList[2024059] = Student(2024059, 'MI');
  // studentList[2024025] = Student(2024025, 'MB');
  // studentList[2024020] = Student(2024020, 'MC');
  // studentList[2023002] = Student(2023002, 'NM');
  // studentList[2022081] = Student(2022081, 'TG');
  // studentList[2024085] = Student(2024085, 'TK');
  // studentList[2023096] = Student(2023096, 'TA');
  // studentList[2022007] = Student(2022007, 'UM');
  // studentList[2024007] = Student(2024007, 'VG');
// final studentList = [
//     Student(2024078, 'AZ1'),
//     Student(2024077, 'AZ2'),
//     Student(2021018, 'AD'),
//     Student(2023139, 'BB'),
//     Student(2025068, 'BS'),
//     Student(2024008, 'DD'),
//     Student(2024095, 'ES1'),
//     Student(2024012, 'ED1'),
//     Student(2024054, 'EB'),
//     Student(2024081, 'ED2'),
//     Student(2024111, 'ES2'),
//     Student(2024059, 'MI'),
//     Student(2024025, 'MB'),
//     Student(2024020, 'MC'),
//     Student(2023002, 'NM'),
//     Student(2022081, 'TG'),
//     Student(2024085, 'TK'),
//     Student(2023096, 'TA'),
//     Student(2022007, 'UM'),
//     Student(2024007, 'VG'),
//   ];

  final studentName = students.getStudent(2024008);
  print(studentName);
}

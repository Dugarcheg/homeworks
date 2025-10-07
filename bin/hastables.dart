import 'package:hastables/binary_search.dart';
import 'package:hastables/linear_search.dart';

void main() {
  final myList = [42, 3, 10, 7, 28, 149, 0, 3, 25, 7, 1];
  var foundIndex = linearSearch(myList, 28);
  print(foundIndex);

  myList.sort();
  print(myList);

  foundIndex = binarySearch(myList, 1);
  print(foundIndex);
}

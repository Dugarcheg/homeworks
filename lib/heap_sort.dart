import 'heap.dart';
import 'dart:math';

void main() {
  final myList = [8, 10, 16, 2, 5, 6];
  print(myList);

  final sortedList = heapSort(myList);
  print(sortedList);
}

List<int> _aMillionRandomNumbers(){
  for(int i = 0; i<1000000; i++){
    final randomNumber = 
  }
}

List<int> heapSort(List<int> list) {
  final List<int> result = [];

  // Make a heap
  final heap = MinHeap();
  for (int value in list) {
    heap.insert(value);
  }

  while (heap.top != null) {
    result.add(heap.removeMin()!);
  }

  return result;
}

class MinHeap {
  final List<int> _data = [];

  int? get top => _data.isEmpty ? null : _data[0];


  void insert(int value) {
    _data.add(value);
    int childIndex = _data.length - 1;
    int parentIndex = (childIndex - 1) ~/ 2;

    while (childIndex > 0 && _data[childIndex] < _data[parentIndex]) {
      _swap(childIndex, parentIndex);
      childIndex = parentIndex;
      parentIndex = (childIndex - 1) ~/ 2;
    }
  }

  int? removeMin() {
    if (_data.isEmpty) return null;
    if (_data.length == 1) return _data.removeLast();

    final min = _data[0];
    _data[0] = _data.removeLast();

    // просеиваем вниз
    int parentIndex = 0;

    while (true) {
      final leftChildIndex = 2 * parentIndex + 1;
      final rightChildIndex = 2 * parentIndex + 2;
      int smallestIndex = parentIndex;

      if (leftChildIndex < _data.length &&
          _data[leftChildIndex] < _data[smallestIndex]) {
        smallestIndex = leftChildIndex;
      }

      if (rightChildIndex < _data.length &&
          _data[rightChildIndex] < _data[smallestIndex]) {
        smallestIndex = rightChildIndex;
      }

      if (smallestIndex != parentIndex) {
        _swap(parentIndex, smallestIndex);
        parentIndex = smallestIndex;
      } else {
        break;
      }
    }

    return min;
  }

  void _swap(int i, int j) {
    final temp = _data[i];
    _data[i] = _data[j];
    _data[j] = temp;
  }
  @override
  String toString() => _data.toString();
}


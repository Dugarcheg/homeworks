class Heap {
  final List<int> _data = [];

  int? get max {
    if (_data.isEmpty) return null;
    return _data[0];
  }

  void insert(int value) {
    _data.add(value);
    int childIndex = _data.length - 1;
    int parentIndex = (childIndex - 1) ~/ 2;
    while (childIndex > 0 && _data[childIndex] > _data[parentIndex]) {
      _swap(childIndex, parentIndex);
      childIndex = parentIndex;
      parentIndex = (childIndex - 1) ~/ 2;
    }
  }

  void _swap(int index1, index2) {
    final temp = _data[index1];
    _data[index1] = _data[index2];
    _data[index2] = temp;
  }

  int? removeMax() {
    if (_data.isEmpty) return null;
    if (_data.length == 1) return _data.removeLast();

    final max = _data[0];
    _data[0] = _data.removeLast();

    while (true) {
      final parentIndex = 0;
      final leftChildIndex = 2 * parentIndex + 1;
      final rightChildIndex = 2 * parentIndex + 2;
      int largestIndex = parentIndex;

      // check left child
      if (leftChildIndex < _data.length &&
          _data[largestIndex] < _data[leftChildIndex]) {
        largestIndex = leftChildIndex;
      }

      // check right child
      if (rightChildIndex < _data.length &&
          _data[largestIndex] < _data[rightChildIndex]) {
        largestIndex = rightChildIndex;
      }

      if (largestIndex != parentIndex) {
        _swap(largestIndex, parentIndex);
      } else {
        break;
      }
    }

    return max;
  }

  @override
  String toString() => _data.toString();
}

void main() {
  final myHeap = Heap();
  myHeap.insert(20);
  myHeap.insert(15);
  myHeap.insert(10);
  myHeap.insert(15);
  myHeap.insert(7);
  myHeap.insert(2);
  print(myHeap.max);

  myHeap.insert(100);
  print(myHeap);
  print(myHeap.max);

  myHeap.removeMax();
  print(myHeap);
}
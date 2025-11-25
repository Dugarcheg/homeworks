import 'dart:math';

void main() {
  print("=== PART 1: Sorting Benchmarks ===");

  const int n = 1000000;
  final random = Random();

  final baseList = List<int>.generate(n, (_) => random.nextInt(100000000));

  final list1 = List<int>.from(baseList);
  final t1 = DateTime.now().millisecondsSinceEpoch;
  mergeSort(list1);
  final t2 = DateTime.now().millisecondsSinceEpoch;
  print("Merge sort: ${t2 - t1} ms");

  final list2 = List<int>.from(baseList);
  final t3 = DateTime.now().millisecondsSinceEpoch;
  radixSort(list2);
  final t4 = DateTime.now().millisecondsSinceEpoch;
  print("Radix sort: ${t4 - t3} ms");


  final list3 = List<int>.from(baseList);
  final t5 = DateTime.now().millisecondsSinceEpoch;
  heapSort(list3);
  final t6 = DateTime.now().millisecondsSinceEpoch;
  print("Heap sort: ${t6 - t5} ms");

  final list4 = List<int>.from(baseList);
  final t7 = DateTime.now().millisecondsSinceEpoch;
  quicksort(list4);
  final t8 = DateTime.now().millisecondsSinceEpoch;
  print("Quicksort: ${t8 - t7} ms");

  print("\n=== PART 2 ===");
  part2_task1();
  part2_task2();
}

void part2_task1() {
  print("\nTask 1: Squaring values in a list");

  final numbers = [3, 6, 9, 12, 15];

  for (var n in numbers) {
    print("$n squared is ${n * n}");
  }
}

void part2_task2() {
  print("\nTask 2: Map of people and ages");

  final people = {
    "Bob": 22,
    "Sarah": 19,
    "Tim": 25,
    "Anna": 21,
    "Mark": 30
  };

  for (var name in people.keys) {
    print("$name is ${people[name]} years old.");
  }
}

void quicksort(List<int> list) {
  _quicksort(list, 0, list.length - 1);
}

void _quicksort(List<int> list, int low, int high) {
  if (low >= high) return;
  final pivotIndex = _partition(list, low, high);
  _quicksort(list, low, pivotIndex - 1);
  _quicksort(list, pivotIndex + 1, high);
}

int _partition(List<int> list, int low, int high) {
  int pivot = list[high];
  int i = low - 1;

  for (int j = low; j < high; j++) {
    if (list[j] <= pivot) {
      i++;
      _swap(list, i, j);
    }
  }
  _swap(list, i + 1, high);
  return i + 1;
}

void _swap(List<int> list, int a, int b) {
  final t = list[a];
  list[a] = list[b];
  list[b] = t;
}

List<int> mergeSort(List<int> list) {
  if (list.length <= 1) return list;

  int mid = list.length ~/ 2;
  final left = mergeSort(list.sublist(0, mid));
  final right = mergeSort(list.sublist(mid));

  return _merge(left, right);
}

List<int> _merge(List<int> left, List<int> right) {
  int i = 0, j = 0;
  final result = <int>[];

  while (i < left.length && j < right.length) {
    if (left[i] <= right[j]) {
      result.add(left[i]);
      i++;
    } else {
      result.add(right[j]);
      j++;
    }
  }
  result.addAll(left.sublist(i));
  result.addAll(right.sublist(j));
  return result;
}

void radixSort(List<int> list) {
  int maxNum = list.reduce(max);
  int exp = 1;

  while (maxNum ~/ exp > 0) {
    _countSort(list, exp);
    exp *= 10;
  }
}

void _countSort(List<int> list, int exp) {
  final output = List<int>.filled(list.length, 0);
  final count = List<int>.filled(10, 0);

  for (var num in list) {
    count[(num ~/ exp) % 10]++;
  }

  for (int i = 1; i < 10; i++) {
    count[i] += count[i - 1];
  }

  for (int i = list.length - 1; i >= 0; i--) {
    int digit = (list[i] ~/ exp) % 10;
    output[count[digit] - 1] = list[i];
    count[digit]--;
  }

  for (int i = 0; i < list.length; i++) {
    list[i] = output[i];
  }
}

void heapSort(List<int> list) {
  int n = list.length;

  for (int i = n ~/ 2 - 1; i >= 0; i--) {
    _heapify(list, n, i);
  }

  for (int i = n - 1; i >= 0; i--) {
    _swap(list, 0, i);
    _heapify(list, i, 0);
  }
}

void _heapify(List<int> list, int n, int i) {
  int largest = i;
  int left = 2 * i + 1;
  int right = 2 * i + 2;

  if (left < n && list[left] > list[largest]) largest = left;
  if (right < n && list[right] > list[largest]) largest = right;

  if (largest != i) {
    _swap(list, i, largest);
    _heapify(list, n, largest);
  }
}
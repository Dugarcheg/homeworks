import 'dart:math';

void main() {
  const int size = 1000000; 
  final random = Random();

  final original = List<int>.generate(size, (_) => random.nextInt(1000000));

  final listForRadix = List<int>.from(original);
  final listForMerge = List<int>.from(original);

  print("Benchmark starting... Please wait.");

  final startRadix = DateTime.now().microsecondsSinceEpoch;
  radixSort(listForRadix);
  final endRadix = DateTime.now().microsecondsSinceEpoch;

  final radixTimeMs = (endRadix - startRadix) / 1000;
  print("Radix Sort time: ${radixTimeMs.toStringAsFixed(2)} ms");

  final startMerge = DateTime.now().microsecondsSinceEpoch;
  final merged = mergeSort(listForMerge);
  final endMerge = DateTime.now().microsecondsSinceEpoch;

  final mergeTimeMs = (endMerge - startMerge) / 1000;
  print("Merge Sort time: ${mergeTimeMs.toStringAsFixed(2)} ms");

  print("Results match: ${listsAreEqual(merged, listForRadix)}");
}

bool listsAreEqual(List<int> a, List<int> b) {
  if (a.length != b.length) return false;
  for (int i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}

void radixSort(List<int> list) {
  if (list.length <= 1) return;

  int place = 1;
  int biggestNumber = list[0];

  for (int i = 1; i < list.length; i++) {
    if (list[i] > biggestNumber) {
      biggestNumber = list[i];
    }
  }

  final numberOfDigits = biggestNumber.toString().length;

  for (int i = 0; i < numberOfDigits; i++) {
    final buckets = List<List<int>>.generate(10, (_) => []);

    for (int value in list) {
      final digit = (value ~/ place) % 10;
      buckets[digit].add(value);
    }

    list.clear();

    for (final bucket in buckets) {
      list.addAll(bucket);
    }

    place *= 10;
  }
}

List<int> mergeSort(List<int> list) {
  if (list.length <= 1) return list;

  final mid = list.length ~/ 2;
  final left = mergeSort(list.sublist(0, mid));
  final right = mergeSort(list.sublist(mid));

  return merge(left, right);
}

List<int> merge(List<int> left, List<int> right) {
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

  while (i < left.length) {
    result.add(left[i++]);
  }
  while (j < right.length) {
    result.add(right[j++]);
  }

  return result;
}
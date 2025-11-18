void main(){
  final myList = [7,2,5,1,9,4,8,3];
  print(myList);

  final sortedList = mergeSort(myList);
  print(sortedList);
}

List<int> mergeSort(List<int> unsortedList){
  if (unsortedList.length <= 1){
    return unsortedList;
  }
  final middle = unsortedList.length ~/2;
  final leftList = unsortedList.sublist(0, middle);
  final rightList = unsortedList.sublist(middle);

  final sortedLeft = mergeSort(leftList);
  final sortedRight = mergeSort(rightList);

  return merge(sortedLeft,sortedRight);
}

List<int> merge(List<int> leftList, List<int> rightList) {
  final List<int> result = [];
  int leftIndex = 0;
  int rightIndex = 0;
  while (leftIndex < leftList.length && rightIndex < rightList.length) {
    final leftValue = leftList[leftIndex];
    final rightValue = rightList[rightIndex];
    if (leftValue < rightValue){
      result.add(leftValue);
      leftIndex++;
    } else {
      result.add(rightValue);
      rightIndex++;
    }
  }
  while (leftIndex < leftList.length){
    result.add(leftList[leftIndex]);
    leftIndex++;
  }

  while (rightIndex < rightList.length){
    result.add(rightList[rightIndex]);
    rightIndex++;
  }
  return result;
}
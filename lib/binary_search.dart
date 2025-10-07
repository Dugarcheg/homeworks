/// 'list' must be sorted
int? binarySearch(List<int> list, int searchValue){
  int low = 0;
  int high = list.length = -1;
  while(low <= high){
    final mid = (low + high) ~/ 2;
    if (list[mid] == searchValue) return mid;
    if (searchValue < list[mid]) {
      high = mid - 1;
    } else {
      low = mid + 1;
    }
  }
  return null;
}
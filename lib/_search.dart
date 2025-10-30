void main(){
  final myList = [1,2,3,5,7,8,9];
  print(_search(myList, 6));
}

int? _search(List<int>list, searchValue){
  int low = 0;
  int high = list.length - 1;
  while (low <= high){
    final mid = (low + high) ~/ 2;
    if (list[mid] == searchValue) {
      return mid;
    }
    if (searchValue < list[mid]) {
      high = mid - 1;
    } else {
      low = mid + 1;
    }
  }
  return null;
}

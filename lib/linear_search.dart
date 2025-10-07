int? linearSearch(List<int> list, int searchValue){
  for (int i = 0; i < list.length; i++){
    if (list[i] == searchValue){
      return i;
    }
  }
  return null;
}
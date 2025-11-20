void main(){
  final List<int> myList = [5,9,24,0,-1,10];
  // for (final value in myList){
    
  //   print(value);
  // }
  int sum = 0;
  for (int i = myList.length - 1; i >= 0; i--) {
    print(myList[i]);
    sum = sum + myList[i];
  }
  print('sum: $sum');

 final myMap = {
  0: 'zero',
  1: 'one',
  2: 'two',
  3: 'three',
  4: 'four',
  5: 'five',
  6: 'six',
  7: 'seven',
  8: 'eight',
  9: 'nine',
 };
  for (final key in myMap.keys){
    print('$key is spelled ${myMap[key]}');
  }
}
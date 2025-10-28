void main(){
  final word = 'pneumonoultramicroscopicsilicovolcanoconiosis';
  final answer = _shorten(word);
  print(answer);
}

String _shorten(String input){
  if (input.length <= 10) return input;
  final firstLetter = input[0];
  final lastLetter = input[input.length - 1];
  final number = input.length - 2;
  return firstLetter + number.toString() + lastLetter;
}
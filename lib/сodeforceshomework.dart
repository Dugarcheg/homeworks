
void main() {
  int t = 3;
  List<String> inputs = ['coolforsez', 'codeforces', 'aaaaaaaaaa'];
  const target = 'codeforces';

  for (int i = 0; i < t; i++) {
    String s = inputs[i];
    int diff = 0;
    for (int j = 0; j < target.length; j++) {
      if (s[j] != target[j]) diff++;
    }
    print(diff);
  }
}

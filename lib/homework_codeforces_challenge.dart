//https://codeforces.com/problemset/problem/1433/A

void main() {

  int t = 4;
  
  List<String> apartments = ['22', '9999', '1', '777'];

  for (String x in apartments) {
    int d = int.parse(x[0]);  
    int len = x.length;        

    int result = (d - 1) * 10 + (len * (len + 1)) ~/ 2;
    print(result);
  }
}
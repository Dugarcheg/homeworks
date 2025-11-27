void main(){
  final grid = [
    [1,3,2],
    [7,6,4],
    [3,0,-1],
    [1,0,2],
  ];
  for(int i = 0; i < grid.length; i++){
    final row = grid[i];
    for(int j = 0; j < row.length;j++){
      print(row[j]);
    }
  }
}
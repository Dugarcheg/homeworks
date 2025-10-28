class BinaryNode {
  final int value;
  final BinaryNode? leftChild;
  final BinaryNode? rightChild;
  BinaryNode(this.value, {this.leftChild, this.rightChild});

  void travelPreOrder(void Function(int) action){
    action(value);
    leftChild?.travelPreOrder(action);
    rightChild?.travelPreOrder(action);
  }

  void travelInOrder(void Function(int) action){
    leftChild?.travelPreOrder(action);
    action(value);
    rightChild?.travelPreOrder(action);
  }

  void travelPostOrder(void Function(int) action){
    leftChild?.travelPreOrder(action);
    rightChild?.travelPreOrder(action);
    action(value);
  }

  @override
   String toString() {
     final buffer = StringBuffer();
     _buildTree(buffer, '', true, true);
     return buffer.toString();
   }

   void _buildTree(
     StringBuffer buffer,
     String prefix,
     bool isTail,
     bool isRoot,
   ) {
     buffer.write(prefix);
     if (!isRoot) {
       buffer.write(isTail ? '└── ' : '├── ');
     }
     buffer.writeln(value);

     final children = <BinaryNode?>[
       leftChild,
     rightChild,
     ].where((child) => child != null).toList();
     for (var i = 0; i < children.length; i++) {
       final child = children[i];
       final newPrefix = prefix + (isTail && !isRoot ? '    ' : '│   ');
       final isLastChild = i == children.length - 1;
     child?._buildTree(buffer, newPrefix, isLastChild, false);
     }
   }
}

void main(){
  final myTree = BinaryNode(42, leftChild: BinaryNode(3, leftChild: BinaryNode(13), rightChild :BinaryNode(4)), rightChild: BinaryNode(10, leftChild: BinaryNode(7), rightChild :BinaryNode(8, leftChild: BinaryNode(7))));

  myTree.travelPostOrder(action);
}
void action(int value){
    print(value);
}
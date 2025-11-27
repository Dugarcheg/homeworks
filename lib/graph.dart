class Edge<T> {
  final T destination;
  final int weight;
  Edge(this.destination, this.weight);

  @override
  String toString() {
    return '($destination, W:$weight)';
  }
}

class Graph<T> {
  final Map<T, List<Edge<T>>> _adjacencyList = {};
  final bool directed;
  Graph({this.directed = false});

  void addVertex(T vertex) {
    if (_adjacencyList.containsKey(vertex)) return;
    _adjacencyList[vertex] = [];
  }

  void addEdge(T source, T destination, {int weight = 1}) {
    // Create source and destination if they don't exist yet
    addVertex(source);
    addVertex(destination);

    // add an edge between source and destination
    _adjacencyList[source]!.add(Edge(destination, weight));

    // if this is an undirected graph, add edge from destination to source
    if (!directed) {
      _adjacencyList[destination]!.add(Edge(source, weight));
    }
  }

  @override
  String toString() {
    final buffer = StringBuffer();
    _adjacencyList.forEach((vertex, edges) {
      String connections = edges
          .map((e) => '${e.destination}(${e.weight})')
          .join(', ');
      buffer.writeln('$vertex: $connections');
    });
    return buffer.toString();
  }
}

void main(){

  final myGraph = Graph();
  myGraph.addEdge('Library', 'Cafeteria');
  myGraph.addEdge('Library', 'Dorm');
  myGraph.addEdge('Cafeteria', 'Gym');
  myGraph.addEdge('Dorm', 'Gym');

  print(myGraph);
}
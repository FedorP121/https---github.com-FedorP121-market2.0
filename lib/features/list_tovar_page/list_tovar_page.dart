import 'package:flutter/material.dart';

// class ListTovarPage extends StatelessWidget {
//   const ListTovarPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//         body: Center(
//       child: Text('dasd'),
//     ));
//   }
// }

// class ListTovarPage extends StatelessWidget {
//   const ListTovarPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(), itemBuilder: itemBuilder)
//       ),
//     );
//   }
// }

class ListTovarPage extends StatelessWidget {
  List<Map<String, dynamic>> _dataList = [
    {'name': 'John', 'age': 25, 'city': 'New York'},
    {'name': 'Alice', 'age': 30, 'city': 'Los Angeles'},
    {'name': 'Bob', 'age': 22, 'city': 'Chicago'},
    // Add more rows here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom GridView')),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Количество колонок
          crossAxisSpacing: 10.0, // отсупы вертикальные
          mainAxisSpacing: 10.0, // отсупы горизонтальные
        ),
        itemCount: _dataList.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 7.0, // тень
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_dataList[index]['name']),
                  Text(_dataList[index]['age'].toString()),
                  Text(_dataList[index]['city']),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

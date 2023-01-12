import 'package:flutter/material.dart';
import 'package:newsly_app/components/widgets/searchbar.dart';

class HomeScreen extends StatelessWidget {
  final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: searchTextField(),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          height: MediaQuery.of(context).size.height * 0.35,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: numbers.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Card(
                    color: Colors.blue,
                    child: Container(
                      child: Center(
                          child: Text(
                        numbers[index].toString(),
                        style: const TextStyle(
                            color: Colors.white, fontSize: 36.0),
                      )),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

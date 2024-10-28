import 'package:flutter/material.dart';

class Personlistwidget extends StatelessWidget {
  final String name;
  final String data;
  const Personlistwidget({super.key, required this.name, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSurface,
            borderRadius: BorderRadius.circular(2)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "name : $name",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary, fontSize: 10),
              ),
              Text(
                "data : $data",
                style: const TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Personlistwidget extends StatelessWidget {
  final Name;
  final Data;
  const Personlistwidget({super.key, this.Name, this.Data});

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
                "Name : $Name",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary, fontSize: 10),
              ),
              Text(
                "Data : $Data",
                style: const TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

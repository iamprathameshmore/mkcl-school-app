import "package:flutter/material.dart";

class CustombtnWidget extends StatelessWidget {
  final OnTap;
  final nameBTN;
  const CustombtnWidget({super.key, this.OnTap, this.nameBTN});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.indigo,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: const BorderSide(color: Colors.indigo)),
        child: InkWell(
          onTap: OnTap,
          child: Container(
            height: 50,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                // color: Colors.indigo.shade500
                borderRadius: BorderRadius.circular(5)),
            child: Text(
              nameBTN,
              style: const TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}

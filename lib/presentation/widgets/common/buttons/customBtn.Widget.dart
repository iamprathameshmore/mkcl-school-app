import "package:flutter/material.dart";

class CustombtnWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String buttonText;
  final bool isLoading;

  const CustombtnWidget({
    super.key,
    required this.onTap,
    required this.buttonText,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.indigo,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: const BorderSide(color: Colors.indigo),
        ),
        child: InkWell(
          onTap: isLoading ? null : onTap,
          child: Container(
            height: 50,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: Text(
              buttonText,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

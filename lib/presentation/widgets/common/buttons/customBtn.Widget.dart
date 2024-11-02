import "package:flutter/material.dart";

class CustombtnWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;
  final isLoading; // `isLoading` is no longer a constant

  const CustombtnWidget({
    super.key,
    required this.onTap,
    required this.buttonText,
    this.isLoading, // Allow external control of loading state
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
          onTap: onTap, // Disable button when loading
          child: Container(
            height: 50,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

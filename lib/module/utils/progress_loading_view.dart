import 'package:flutter/material.dart';

class ProgressLoadingView extends StatelessWidget {
  const ProgressLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
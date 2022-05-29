import 'package:flutter/material.dart';

class FailureView extends StatelessWidget {
  FailureView({
    this.title = "Error",
    this.message = "Something went wrong",
    required this.onPressed,
  });
  String title, message;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}

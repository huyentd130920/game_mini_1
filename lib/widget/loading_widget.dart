
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.red),),
        )
      ],
    );
  }
}

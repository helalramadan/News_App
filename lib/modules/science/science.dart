import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Science Screen",
        style: TextStyle(
          fontSize: 35.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    ;
  }
}

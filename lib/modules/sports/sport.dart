import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Sports Screen",
        style: TextStyle(
          fontSize: 35.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

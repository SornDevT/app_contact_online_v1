import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
            SizedBox(
              height: 10,
            ),
            Text('ກຳລັງກວດຊອບຂໍ້ມູນ....'),
          ],
        ),
      ),
    );
  }
}

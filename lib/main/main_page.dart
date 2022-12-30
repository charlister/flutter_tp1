import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
        centerTitle: false,
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                      Colors.lightBlue)
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/exo1");
                    },
                    child: const Text(
                      "Profile Page",
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                  TextButton(
                    style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                      Colors.lightBlue)
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/exo2");
                    },
                    child: const Text(
                      "Quizz Page",
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1)
                      ),
                    ),
                  )
                ],
              ),
            )
          ),
        ),
      ),
    );
  }
}

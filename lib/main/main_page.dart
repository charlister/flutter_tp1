import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Card"),
        centerTitle: false,
      ),

      body: SingleChildScrollView(
        child: Container(
            alignment: Alignment.center,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Colors.lightBlue)
                  ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/exo1");
                    },
                    child: Text("Profile Page",
                      style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),),
                  ),
                  TextButton(style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Colors.lightBlue)
                  ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/exo2");
                    },
                    child: Text("Quizz Page",
                      style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),),
                  )
                ],
              ),
            )

        ),
      )
    );
  }
}

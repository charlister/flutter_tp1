import 'package:flutter/material.dart';

class ProfileHomePage extends StatelessWidget {
  const ProfileHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Card"),
        centerTitle: false,
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Stack(
              children: [
                _getCard(),
                Positioned(
                  top: .0,
                  left: .0,
                  right: .0,
                  child: Center(
                    child: _getAvatar(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _getTextRow(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // pour centrer Row
      children: [
        Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 18.0,
                fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    );
  }

  /**
   * Retourne un Widget Container qui définit une Card
   */
  Container _getCard() {
    return Container(
      padding: const EdgeInsets.only(top: 50.0),
      child: Card(
        color: Colors.deepPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: SizedBox(
          width: 300,
          height: 300,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center, // pour centrer la colonne dans Card
                children: [
                  _getTextRow("Rihab Haoulani"),
                  _getTextRow("rh@haha.jc"),
                  _getTextRow("instagram: xxxx"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  /**
   * Retourne un Widget Container qui définit une avatar dans une forme circulaire.
   */
  Container _getAvatar() {
    return Container(
      child: const CircleAvatar(
        radius: 50.0,
        backgroundColor: Colors.deepPurple,
        child: CircleAvatar(
          backgroundImage: AssetImage('images/Rihab.png'),
          radius: 48,
        ),
      ),
    );
  }
}
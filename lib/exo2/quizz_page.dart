import 'package:flutter/material.dart';

class QuizzPage extends StatefulWidget {
  const QuizzPage({Key? key, required this.title}) : super(key: key);
  final String title;

  // l'état du widget est créé à partir de la classe le réifiant
  @override
  State<QuizzPage> createState() => SomeQuizzPageState(title);
}

class SomeQuizzPageState extends State<QuizzPage> {
  int _questionNumber = 0;
  int _score = 0;
  bool _userChoice = false;
  String _title = "";
  final _questions = [
    Question(
      questionText: "Le Kilimandjaro est le plus haut sommet au monde.",
      isCorrect: false,
      imagePath: "images/montagnes.jpg"
    ),
    Question(
      questionText: "Les méduses sont apparues après les dinosaures.",
      isCorrect: false,
      imagePath: "images/meduses.jpg"
    ),
    Question(
      questionText: "L'Inde est le second pays à posséder la plus grande population au monde.",
      isCorrect: true,
      imagePath: "images/inde.jpg"
    ),
  ];

  SomeQuizzPageState(String title) {
    _title = title;
  }

  Question _nextQuestion() {
    _questionNumber = _questionNumber+1;
    return _questions[_questionNumber];
  }

  bool _checkAnswer(bool userChoice, BuildContext context){
    if(_questions[_questionNumber].isCorrect == userChoice) {
      return true;
    }
    return false;
  }

  void _reset() {
    _score = 0;
    _questionNumber = 0;
    _userChoice = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: _questionNumber < _questions.length ?
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Numéro de question
              Container(
                  margin: const EdgeInsets.only(
                      top: 10,
                      left: 10,
                      bottom: 10
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'Question ${_questionNumber + 1}/${_questions.length}',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
              ),

              // Séparateur
              const Divider(
                color: Color.fromARGB(100, 0, 0, 0),
                indent: 10,
                endIndent: 10,
              ),

              // image/question
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    // Image
                    buildThemeImage(_questions[_questionNumber].imagePath),
                    buildQuestion(_questions[_questionNumber].questionText),
                  ],
                ),
              ),
              // Boutons
              Row( // pour les boutons
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(Colors.lightBlue)
                  ),
                    onPressed: () {
                      setState(() {
                        _userChoice = true;
                      });
                    },
                    child: const Text("VRAI", style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),),
                  ),
                  TextButton(style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(Colors.lightBlue)
                  ),
                    onPressed: () {
                      setState(() {
                        _userChoice = false;
                      });
                    },
                    child: const Text("FAUX", style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),),
                  ),
                  TextButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.lightBlue)
                    ),
                    onPressed: () {
                      setState(() {
                        if (_checkAnswer(_userChoice, context)) {
                          _score += 1;
                        }
                        if ((_questionNumber+1)<(_questions.length)) {
                          _nextQuestion();
                        }
                        else {
                          _questionNumber++;
                        }
                      });
                    },
                    child: const Text("SUIVANT", style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),),
                  )
                ],
              ),

            ],
          ) :
          Column( // Résultats
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  'Score :',
                  style: TextStyle(
                      fontSize: 25
                  ),
                ),
              ),
              Center(
                child: Text(
                  '$_score/${_questions.length}',
                  style: const TextStyle(
                      fontSize: 25
                  ),
                ),
              ),
              Center(
                child: Image(
                  height: 50,
                  width: 50,
                  image: _score > _score/2 ? const AssetImage('images/good.png') : const AssetImage('images/bad.png'),
                ),
              ),
            ],
          ), // pour le résultat
        ),
      )
    );
  }
}

Card buildThemeImage(String imagePath) {
  return Card(
    child: Container(
      child: Image(
        image: AssetImage(imagePath),
        height: 300,
        width: 300,
      ),
    ),
  );
}

Card buildQuestion(String question) {
  return Card(
    color: Colors.blue,
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        // gradient: const LinearGradient(
        //   colors: [Colors.lightBlue, Colors.blue],
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        // ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(height: 16),
          Text(
            question,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    ),
  );
}

class Question {
  String questionText;
  bool isCorrect;
  String imagePath;

  Question({required this.questionText, required this.isCorrect, required this.imagePath});
}
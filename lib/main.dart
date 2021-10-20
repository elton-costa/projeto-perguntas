import 'package:flutter/material.dart';
import './questao.dart';
import 'resposta.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      {
        'texto': 'Qual é sua cor favorita?',
        'resposta': ['Branco', 'Azul', 'Preto', 'Vermelho'],
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'resposta': ['Raposa', 'Tigre', 'Elefante', 'Leão'],
      },
      {
        'texto': 'Qual é seu esporte favorito?',
        'resposta': ['Skate', 'Patins', 'Futebol', 'Bicicleta'],
      }
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: Column(
          children: <Widget>[
            Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
            Resposta('Respota 1', _responder),
            Resposta('Respota 2', _responder),
            Resposta('Respota 3', _responder),
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

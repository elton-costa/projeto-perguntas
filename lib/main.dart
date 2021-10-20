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
        'respostas': ['Branco', 'Azul', 'Preto', 'Vermelho'],
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'respostas': ['Raposa', 'Tigre', 'Elefante', 'Leão'],
      },
      {
        'texto': 'Qual é seu esporte favorito?',
        'respostas': ['Skate', 'Patins', 'Futebol', 'Bicicleta'],
      }
    ];

    List<String> respostas =
        perguntas[_perguntaSelecionada].cast()['respostas'];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: Column(
          children: <Widget>[
            Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
            ...respostas.map((t) => Resposta(t, _responder)).toList(),
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

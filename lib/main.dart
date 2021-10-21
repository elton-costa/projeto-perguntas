import 'package:flutter/material.dart';
import './questao.dart';
import 'resposta.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  final _perguntas = const [
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

  void _responder() {
    if (temPergSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPergSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPergSelecionada
        ? _perguntas[_perguntaSelecionada].cast()['respostas']
        : [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPergSelecionada
            ? Column(
                children: <Widget>[
                  Questao(_perguntas[_perguntaSelecionada]['texto'].toString()),
                  ...respostas.map((t) => Resposta(t, _responder)).toList(),
                ],
              )
            : const Center(
                child: Text(
                  'Perguntas Finalizadas',
                  style: TextStyle(fontSize: 28),
                ),
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

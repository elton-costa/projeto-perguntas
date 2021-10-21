import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resultado.dart';
import './questionario.dart';
import './resultado.dart';

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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPergSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder)
            : Resultado(),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

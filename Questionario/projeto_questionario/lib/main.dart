import 'package:flutter/material.dart';
import './questao.dart';
import './respostas.dart';
import './resultado.dart';
import './questionario.dart';

void main() {
  runApp(new PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é sua cor favorita?',
      'resposta': [
        {'texto': 'Azul', 'pontuacao': 10},
        {'texto': 'Preto', 'pontuacao': 7},
        {'texto': 'Branco', 'pontuacao': 4},
        {'texto': 'Verde', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'resposta': [
        {'texto': 'Gato', 'pontuacao': 10},
        {'texto': 'Passarinho', 'pontuacao': 7},
        {'texto': 'Cachorro', 'pontuacao': 4},
        {'texto': 'Cavalo', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu time do coração?',
      'resposta': [
        {'texto': 'Galo', 'pontuacao': 10},
        {'texto': 'America', 'pontuacao': 7},
        {'texto': 'Corinthias', 'pontuacao': 4},
        {'texto': 'Cruzeiro', 'pontuacao': 0},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quantoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

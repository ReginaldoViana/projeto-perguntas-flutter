import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaselecionada;
  final void Function(int) responder;

  Questionario({
    required this.perguntas,
    required this.perguntaselecionada,
    required this.responder,
  });

  bool get temPerguntaSelecionada {
    return perguntaselecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaselecionada].cast()['respostas']
        : [];

    return Column(
      children: [
        Questao(perguntas[perguntaselecionada]['texto'].toString()),
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'].toString(),
            () => responder(resp['pontuacao']),
          );
        }).toList(),
      ],
    );
  }
}

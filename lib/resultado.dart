import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionaria;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionaria);

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabens !';
    } else if (pontuacao < 12) {
      return 'Você é bom !';
    } else if (pontuacao < 16) {
      return 'Impressionante !';
    } else {
      return 'Nível Jedi !';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        TextButton(
          onPressed: quandoReiniciarQuestionaria,
          style: TextButton.styleFrom(backgroundColor: Colors.blue),
          child: Text(
            'Reiniciar',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

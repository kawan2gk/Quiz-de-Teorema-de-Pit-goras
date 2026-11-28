
import 'dart:io';

void main() {

  print('======================================');
  print('       QUIZ MATEMÁTICO');
  print('    DESAFIO DE PITÁGORAS');
  print('======================================');

  print('\nSeja bem-vindo ao desafio!');
  print('Teste seus conhecimentos matemáticos!\n');

  // Identificação do jogador
  stdout.write('Digite seu nome: ');
  String nome = stdin.readLineSync() ?? '';

  print('\nOlá, $nome! Prepare-se para começar!\n');

  // Lista de perguntas
  List<Map<String, dynamic>> perguntas = [

    { 
      'pergunta': '1. Qual é a fórmula do Teorema de Pitágoras?',
      'alternativas': [
        'A) a + b = c',
        'B) a² + b² = c²',
        'C) a² - b² = c²',
        'D) a x b = c'
      ],
      'correta': 'B'
    },

    {
      'pergunta': '2. Um triângulo possui catetos de 3 cm e 4 cm. Qual é a hipotenusa?',
      'alternativas': [
        'A) 5 cm',
        'B) 6 cm',
        'C) 7 cm',
        'D) 8 cm'
      ],
      'correta': 'A'
    },

    {
      'pergunta': '3. Os catetos medem 6 cm e 8 cm. Qual é a hipotenusa?',
      'alternativas': [
        'A) 9 cm',
        'B) 10 cm',
        'C) 12 cm',
        'D) 14 cm'
      ],
      'correta': 'B'
    },

    {
      'pergunta': '4. Uma escada de 13 m está a 5 m da parede. Qual altura ela alcança?',
      'alternativas': [
        'A) 8 m',
        'B) 10 m',
        'C) 12 m',
        'D) 15 m'
      ],
      'correta': 'C'
    },

    {
      'pergunta': '5. Um retângulo mede 9 m por 12 m. Qual é sua diagonal?',
      'alternativas': [
        'A) 13 m',
        'B) 14 m',
        'C) 15 m',
        'D) 16 m'
      ],
      'correta': 'C'
    }

  ];

  int acertos = 0;

  // Percorrer a lista de perguntas
  for (int i = 0; i < perguntas.length; i++) {

    print('\n======================================');

    print(perguntas[i]['pergunta']);

    // Mostrar alternativas
    for (String alternativa in perguntas[i]['alternativas']) {
      print(alternativa);
    }

    // Receber resposta
    String resposta = '';

    while (!['A', 'B', 'C', 'D'].contains(resposta)) {

      stdout.write('\nDigite sua resposta: ');

      resposta = (stdin.readLineSync() ?? '')
          .trim()
          .toUpperCase();

      if (!['A', 'B', 'C', 'D'].contains(resposta)) {
        print('Resposta inválida! Digite A, B, C ou D.');
      }
    }

    // Verificar resposta
    if (resposta == perguntas[i]['correta']) {

      print('\nMuito bem, $nome! Resposta correta!');
      acertos++;

    } else {

      print('\nResposta incorreta!');
      print('A resposta correta era: ${perguntas[i]['correta']}');

    }

  }

  // Resultado final
  print('\n======================================');
  print('           RESULTADO FINAL');
  print('======================================');

  print('Jogador: $nome');
  print('Acertos: $acertos de ${perguntas.length}');

  // Mensagem conforme pontuação
  if (acertos == 5) {

    print('Excelente! Você é um mestre de Pitágoras!');

  } else if (acertos >= 3) {

    print('Muito bem! Você está no caminho certo!');

  } else if (acertos >= 1) {

    print('Continue praticando! Você consegue melhorar!');

  } else {

    print('Não desanime! Revise o conteúdo e tente novamente!');

  }

  print('\nObrigado por participar do Quiz Matemático!');

}

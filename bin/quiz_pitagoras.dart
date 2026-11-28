
import 'dart:io';


void main() {

  print('======================================');
  print('          QUIZ MATEMÁTICO');
  print('       DESAFIO DE PITÁGORAS');
  print('======================================');

  // Lista de jogadores e pontuações
  List<Map<String, dynamic>> ranking = [];

  // Primeiro jogador
  String nome = solicitarNome();

  bool continuar = true;

  // Menu principal
  while (continuar) {

    print('\n======================================');
    print('             MENU PRINCIPAL');
    print('======================================');
    print('Jogador atual: $nome');
    print('--------------------------------------');
    print('1 - Jogar');
    print('2 - Adicionar novo jogador');
    print('3 - Ver ranking');
    print('4 - Encerrar o jogo');
    print('======================================');

    String opcao = '';

    // Validar escolha
    while (!['1', '2', '3', '4'].contains(opcao)) {

      stdout.write('Escolha uma opção: ');

      opcao = (stdin.readLineSync() ?? '').trim();

      if (!['1', '2', '3', '4'].contains(opcao)) {
        print('Opção inválida! Digite 1, 2, 3 ou 4.');
      }
    }

    // OPÇÃO 1 - JOGAR
    if (opcao == '1') {

      int pontos = executarQuiz(nome);

      registrarPontuacao(ranking, nome, pontos);

    }

    // OPÇÃO 2 - NOVO JOGADOR
    else if (opcao == '2') {

      nome = solicitarNome();

      print('\nJogador alterado com sucesso!');
      print('Agora é a vez de $nome!');

    }

    // OPÇÃO 3 - VER RANKING
    else if (opcao == '3') {

      mostrarRanking(ranking);

      print('\nRetornando ao menu principal...');

    }

    // OPÇÃO 4 - ENCERRAR
    else if (opcao == '4') {

      mostrarRanking(ranking);

      print('\n======================================');
      print('       JOGO ENCERRADO!');
      print('======================================');
      print('Obrigado por participar!');

      continuar = false;

    }

  }

}


// Solicitar nome do jogador
String solicitarNome() {
  String nome = '';

  while (nome.isEmpty) {
    stdout.write('\nDigite o nome do jogador: ');

    nome = (stdin.readLineSync() ?? '').trim();

    if (nome.isEmpty) {
      print('O nome não pode ficar vazio!');
    }
  }

  print('\nOlá, $nome! Prepare-se para começar!');

  return nome;
}

// Executar o Quiz
int executarQuiz(String nome) {

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
      'pergunta': '2. Catetos de 3 cm e 4 cm. Qual é a hipotenusa?',
      'alternativas': [
        'A) 5 cm',
        'B) 6 cm',
        'C) 7 cm',
        'D) 8 cm'
      ],
      'correta': 'A'
    },

    {
      'pergunta': '3. Catetos de 6 cm e 8 cm. Qual é a hipotenusa?',
      'alternativas': [
        'A) 9 cm',
        'B) 10 cm',
        'C) 12 cm',
        'D) 14 cm'
      ],
      'correta': 'B'
    },

    {
      'pergunta': '4. Uma escada de 13 m está a 5 m da parede. Qual altura alcança?',
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

  // Percorrer as perguntas
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

      print('\nParabéns, $nome! Você acertou!');
      acertos++;

    } else {

      print('\nResposta incorreta!');
      print('A alternativa correta era: ${perguntas[i]['correta']}');

    }
  }

  // Resultado final
  print('\n======================================');
  print('           RESULTADO FINAL');
  print('======================================');

  print('Jogador: $nome');
  print('Acertos: $acertos de ${perguntas.length}');

  if (acertos == 5) {

    print('Excelente! Você é um mestre de Pitágoras!');

  } else if (acertos >= 3) {

    print('Muito bem! Você está no caminho certo!');

  } else if (acertos >= 1) {

    print('Continue praticando!');

  } else {

    print('Não desanime! Continue estudando!');

  }

  // Retornar pontuação para o ranking
  return acertos;
}

// Registrar pontuação no ranking
void registrarPontuacao(
    List<Map<String, dynamic>> ranking,
    String nome,
    int pontos) {

  // Verificar se o jogador já existe
  int indice = ranking.indexWhere(
    (jogador) =>
        jogador['nome'].toString().toLowerCase() ==
        nome.toLowerCase()
  );

  if (indice == -1) {

    // Cadastrar novo jogador
    ranking.add({
      'nome': nome,
      'pontos': pontos
    });

  } else {

    // Atualizar somente se conseguir uma pontuação maior
    if (pontos > ranking[indice]['pontos']) {

      ranking[indice]['pontos'] = pontos;

    }

  }

  print('\nPontuação registrada no ranking!');
}

// Mostrar ranking
void mostrarRanking(List<Map<String, dynamic>> ranking) {

  print('\n======================================');
  print('          RANKING GERAL');
  print('======================================');

  if (ranking.isEmpty) {

    print('Nenhum jogador cadastrado ainda.');
    return;

  }

  // Ordenar da maior para a menor pontuação
  ranking.sort((a, b) =>
      b['pontos'].compareTo(a['pontos']));

  int posicao = 0;
  int pontuacaoAnterior = -1;

  for (int i = 0; i < ranking.length; i++) {

    int pontos = ranking[i]['pontos'];

    // Empatados recebem a mesma posição
    if (pontos != pontuacaoAnterior) {
      posicao = i + 1;
    }

    pontuacaoAnterior = pontos;

    String medalha = '';

    if (posicao == 1) {
      medalha = ' OURO';
    } else if (posicao == 2) {
      medalha = ' PRATA';
    } else if (posicao == 3) {
      medalha = ' BRONZE';
    }

    print(
      '$posicaoº - ${ranking[i]['nome']}'
      ' | $pontos de 5 pontos$medalha'
    );
  }

  print('======================================');
}

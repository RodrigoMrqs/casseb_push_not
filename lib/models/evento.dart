class Evento {
  final String id;
  final String titulo;
  final String data;
  final String local;
  final String descricao;
  final String imagem;

  const Evento({
    required this.id,
    required this.titulo,
    required this.data,
    required this.local,
    required this.descricao,
    required this.imagem,
  });
}

/// Dados definidos no código (não há banco de dados nesta atividade).
const List<Evento> eventos = [
  Evento(
    id: '1',
    titulo: 'Semana de Tecnologia',
    data: '18/11/2026 às 19h',
    local: 'Auditório Principal',
    descricao: 'Palestras e oficinas sobre desenvolvimento mobile, nuvem e '
        'inteligência artificial com profissionais do mercado.',
    imagem: 'https://picsum.photos/id/0/800/450',
  ),
  Evento(
    id: '2',
    titulo: 'Hackathon Universitário',
    data: '25/11/2026 às 08h',
    local: 'Laboratório 3',
    descricao: '12 horas para criar uma solução em equipe. Prêmios para os '
        'três melhores projetos.',
    imagem: 'https://picsum.photos/id/180/800/450',
  ),
  Evento(
    id: '3',
    titulo: 'Workshop de Flutter',
    data: '02/12/2026 às 14h',
    local: 'Sala 204',
    descricao: 'Oficina prática: construa um app com notificações push '
        'usando Flutter e Firebase Cloud Messaging.',
    imagem: 'https://picsum.photos/id/119/800/450',
  ),
  Evento(
    id: '4',
    titulo: 'Feira de Carreiras',
    data: '09/12/2026 às 10h',
    local: 'Pátio Central',
    descricao: 'Empresas parceiras apresentam vagas de estágio e trainee. '
        'Traga seu currículo.',
    imagem: 'https://picsum.photos/id/1/800/450',
  ),
];

Evento? buscarEvento(String? id) {
  for (final e in eventos) {
    if (e.id == id) return e;
  }
  return null;
}

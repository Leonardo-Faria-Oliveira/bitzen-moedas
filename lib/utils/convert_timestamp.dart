String convertTimestamp(String timestampStr) {
  // Converter a string de timestamp para um inteiro
  int timestamp = int.parse(timestampStr);

  // Verificar se o timestamp está em segundos ou milissegundos
  if (timestampStr.length == 10) {
    // Se for em segundos (10 dígitos), multiplicar por 1000 para obter milissegundos
    timestamp *= 1000;
  }

  // Criar um objeto DateTime a partir do timestamp
  DateTime data = DateTime.fromMillisecondsSinceEpoch(timestamp);

  // Retornar a data formatada
  return '${data.day}/${data.month}/${data.year}';
}
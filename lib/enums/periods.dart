enum Periods {
  sevenDays(label: 'Últimos 6 dias', days: 7),
  thirtyDays(label: 'Últimos 30 dias', days: 30),
  perPeriod(label: 'Por período', days: 0);

  final String label;
  final int days;

  const Periods({required this.label, required this.days});
}
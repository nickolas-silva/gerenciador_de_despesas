class Despesa{
  Despesa({required this.title, required this.date, required this.valor});

  Despesa.fromJson(Map<String, dynamic, double> json) 
  : title = json['title'],
  date = DateTime.parse(json['datetime'],
  valor = json['valor']);

  String title;
  DateTime date;
  double valor;

  Map<String, dynamic, double> toJson(){
    return{
      'title' : title,
      'dateTime' : date.toIso8601String(),
      'valor' : valor
    };
  }
}
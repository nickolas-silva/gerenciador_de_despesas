class Despesa{
  Despesa({required this.title, required this.date, required this.valor});

  Despesa.fromJson(Map<String, dynamic> json) 
  : title = json['title'],
  date = DateTime.parse(json['datetime']),
  valor = json['valor'];

  String title;
  DateTime date;
  String valor;

  Map<String, dynamic> toJson(){
    return{
      'title' : title,
      'dateTime' : date.toIso8601String(),
      'valor' : valor
    };
  }
}
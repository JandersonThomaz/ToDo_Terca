class Tarefa {
  int id;
  String titulo;
  String descricao;
  bool finalizada = false;

  Tarefa(this.id, this.titulo, this.descricao);

  void finalizar(){
    finalizada = true;
  }

  void iniciar(){
    finalizada = false;
  }

  Map<String, Object?> toMap() {
    return {
      'titulo': titulo, 
      'descricao': descricao,
      'finalizada': finalizada ? 1 : 0
      };
  }

}
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

}
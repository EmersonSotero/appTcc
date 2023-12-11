import 'package:hive_flutter/hive_flutter.dart';

class Conn {
  var box = Hive.box('Formulario');

  closeBox() {
    box.close();
  }

  pageFatores(double altura, double largura, double sombra, double inclinacao, String telhadoTipo) {
    box.put('altura', altura);
    box.put('largura', largura);
    box.put('sombra', sombra);
    box.put('inclinacao', inclinacao);
    box.put('tipoTelhado', telhadoTipo);
  }

  pageConsumo(List li) {
    box.put('janeiro', li[0]);
    box.put('fevereiro', li[1]);
    box.put('marco', li[2]);
    box.put('abril', li[3]);
    box.put('maio', li[4]);
    box.put('junho', li[5]);
    box.put('julho', li[6]);
    box.put('agosto', li[7]);
    box.put('setembro', li[8]);
    box.put('outubro', li[9]);
    box.put('novembro', li[10]);
    box.put('dezembro', li[11]);
  
  }

  pageHsp(double hsp) {
    box.put('hsp', hsp);
  }

  getAll() {
    return box.toMap();
  }

  mediaDiaria() {
    Map li = getAll();
    double mes1 = li['janeiro'];
    double mes2 = li['fevereiro'];
    double mes3 = li['marco'];
    double mes4 = li['abril'];
    double mes5 = li['maio'];
    double mes6 = li['junho'];
    double mes7 = li['julho'];
    double mes8 = li['agosto'];
    double mes9 = li['setembro'];
    double mes10 = li['outubro'];
    double mes11 = li['novembro'];
    double mes12 = li['dezembro'];

    double soma = mes1 +
        mes2 +
        mes3 +
        mes4 +
        mes5 +
        mes6 +
        mes7 +
        mes8 +
        mes9 +
        mes10 +
        mes11 +
        mes12;

    double mediaMes = soma / 12;
    double mediaDia = mediaMes / 30;
    return mediaDia;
  }

  double mediaMes(){
    Map li = getAll();
    double mes1 = li['janeiro'];
    double mes2 = li['fevereiro'];
    double mes3 = li['marco'];
    double mes4 = li['abril'];
    double mes5 = li['maio'];
    double mes6 = li['junho'];
    double mes7 = li['julho'];
    double mes8 = li['agosto'];
    double mes9 = li['setembro'];
    double mes10 = li['outubro'];
    double mes11 = li['novembro'];
    double mes12 = li['dezembro'];

    double soma = mes1 +
        mes2 +
        mes3 +
        mes4 +
        mes5 +
        mes6 +
        mes7 +
        mes8 +
        mes9 +
        mes10 +
        mes11 +
        mes12;

    double mediaMes = soma / 12;
    return mediaMes;
  }

  saveRelatorio(Map value) {
    box.put('relatorio', value);
  }

  saveRelatorio2(Map value){
    box.put("relatorio2", value);
  }

  getRelatorio() {
    Map li = getAll();
    Map relatorio;
    if (li['relatorio'] != null) {
      relatorio = li['relatorio'];
    } else {
      relatorio = {};
    }

    return relatorio;
  }

  getRelatorio2(){
    Map li = getAll();
    Map relatorio;
     if (li['relatorio'] != null) {
      relatorio = li['relatorio2'];
    } else {
      relatorio = {};
    }
    return relatorio;
  }

  deleteFomumlario() {
    box.clear();
  }
}

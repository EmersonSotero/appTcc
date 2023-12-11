class Material{
  int _id;
  String _nome;
  double _valor = 0.0;
  int _quantidade = 0;
  Material({ required int id, required String nome, required double valor }) : _id = id, _nome = nome, _valor = valor;
  int get id => _id;
  set id(value) => _id = value;
  String get nome => _nome;
  set nome(value) => _nome = value;
  double get valor => _valor;
  set valor(value) => _valor = value;
  int get quantidade => _quantidade;
  set quantidade(value) => _quantidade = value;
  double valorTotal(){
    return valor * quantidade;
  }
}
enum Posicao{ horizontal, vertical}
enum MetodoInstalacao{ paralelo, perpendicular}
enum Tipo{padrao, micro}
class Trilho extends Material{
  double _comprimento = 0;
  double _distanciamentoLateral = 0;
  Posicao _posicao;
  double get comprimento => _comprimento;
  set comprimento(value) => _comprimento = value;
  double get distanciamentoLateral => _distanciamentoLateral;
  set distanciamentoLateral(value) => _distanciamentoLateral = value;
  Posicao get posicao => _posicao;
  set posicao(value) => _posicao = value;
  Trilho({ required super.id,
          required super.nome,
          required super.valor,
          required Posicao posicao}) :
    _posicao = posicao 
    ;

 
  double comprimentoTotal(){
    double valor = (_quantidade * _comprimento);
    return valor;
  }
}

class ModuloFotovoltaico extends Material{
  double _altura;
  double _largura;
  double _potenciaPico;
  Posicao _posicao;
  double eficiencia;
  ModuloFotovoltaico({
    required super.id,
    required super.nome,
    required double altura,
    required double largura,
    required double potenciaPico,
    required Posicao posicao,
    required super.valor,
    required this.eficiencia
  }) :
  _altura = altura,
  _largura = largura,
  _potenciaPico = potenciaPico,
  _posicao = posicao
  ;
  double get altura => _altura;
  set altura(value) => _altura = value;
  double get largura => _largura;
  set largura(value) => _largura = value;
  double get potenciaPico => _potenciaPico;
  set potenciaPico(value) => _potenciaPico = value;
  Posicao get posicao => _posicao;
  set posicao(value) => _posicao = value;
  void definirQuantidade(double potenciaPicoSistema){
    _quantidade = (potenciaPicoSistema/_potenciaPico).floor() + 1;
  }
  double comprimentoTotal( MetodoInstalacao metodo, MidClamp midClamp){
    double comprimento = 0;
    switch(metodo){
      case MetodoInstalacao.paralelo:
        comprimento = _quantidade * _altura;
        break;
          case MetodoInstalacao.perpendicular:
        comprimento = _quantidade * _largura;
        break;
    }
     comprimento = double.parse(comprimento.toStringAsFixed(2))  + (midClamp.quantidade/2) * midClamp._comprimento;
    return comprimento;
  }
  double potenciaPicoSistemaTotal(){
    return potenciaPico * quantidade;
  }
}

class MidClamp extends Material{
  double _comprimento;
  MidClamp({
    required super.id,
    required super.nome,
    required super.valor,
    required comprimento
  }) :
  _comprimento = comprimento;
  double get comprimento => _comprimento;
  set comprimento(value) => _comprimento = value;
  void definirMidClamps( int quantidadeModulos){
    _quantidade = (quantidadeModulos - 1) * 2;
  }
}
class EndClamp extends Material{
  EndClamp({
    required super.id,
    required super.nome,
    required super.valor,
  }) 
  ;
}
class Hook extends Material{
  Hook({
    required super.id,
    required super.nome,
    required super.valor,
  });
  void definirHooks( double tamanhoTrilho){
    double valor = 1 + (tamanhoTrilho - 1.5)/1.5;
    _quantidade = ( valor.floor() + 1) * 2;
  }
} 
class EmendaPerfil extends Material{
  EmendaPerfil({
    required super.id,
    required super.nome,
    required super.valor
  });
}
class ClipAterramento extends Material{
  ClipAterramento({
    required super.id,
    required super.nome,
    required super.valor
  });
}
class GrampoAterramento extends Material{
  GrampoAterramento({
    required super.id,
    required super.nome,
    required super.valor
  });
}
class JumperAterramento extends Material{
  JumperAterramento({
    required super.id,
    required super.nome,
    required super.valor
  });
}
class Inversor extends Material{
  Tipo _tipo;
  double _potencia;
  Inversor({
    required super.id,
    required super.nome,
    required super.valor,
    required Tipo tipo,
    required double potencia
  }) :
  _tipo = tipo,
  _potencia = potencia;
  Tipo get tipo => _tipo;
  set tipo(value) => _tipo = value;
  double get potencia => _potencia;
  set potencia(value) => _potencia = value;
}
class Estrutura{
  double? largura;
  double? altura;
  double potenciaPicoSistema;
  late ModuloFotovoltaico moduloFotovoltaico;
  late MidClamp midClamp;
  late Trilho trilho;
  late Hook hook;
  late EndClamp endClamp;
  late EmendaPerfil emendaPerfil;
  late GrampoAterramento grampoAterramento;
  late ClipAterramento clipAterramento;
  late JumperAterramento jumperAterramento;
  String tipoTelhado;
  Estrutura({
    this.largura,
    this.altura,
    required this.potenciaPicoSistema,
    required this.tipoTelhado
  });
  void definirEstrutura(){
    Map moduloEscolhido = escolherModulo();
    moduloFotovoltaico = ModuloFotovoltaico(id: moduloEscolhido['id'],
                                                   nome: moduloEscolhido['modelo'],
                                                   altura: moduloEscolhido['altura'],
                                                   largura: moduloEscolhido['largura'],
                                                   potenciaPico: moduloEscolhido['potenciaPico'],
                                                   valor: moduloEscolhido['preco'],
                                                   posicao: Posicao.vertical,
                                                   eficiencia: moduloEscolhido['eficiência']);
    moduloFotovoltaico.definirQuantidade(potenciaPicoSistema);
    Map midClampEscolhido = escolherMidClamp();
    midClamp = MidClamp(id: midClampEscolhido['id'] ,
                         nome: midClampEscolhido['modelo'],
                        valor: midClampEscolhido['preco'],
                        comprimento: 0.04);
    midClamp.definirMidClamps(moduloFotovoltaico.quantidade);
    trilho = escolherTrilho(moduloFotovoltaico.comprimentoTotal( MetodoInstalacao.perpendicular ,midClamp));
    hook = escolherHook(trilho._comprimento, tipoTelhado);
    clipAterramento = ClipAterramento(id: 0, nome: "CLP2A", valor: 3.20);
    clipAterramento.quantidade = midClamp.quantidade;
    grampoAterramento = GrampoAterramento(id: 0, nome: "ATERRA2A", valor: 2.53);
    grampoAterramento.quantidade =2;
    endClamp = escolherEndClamp();
    emendaPerfil = escolherEmendaPerfil((trilho.quantidade/2).floor());
    jumperAterramento = JumperAterramento(id: 0, nome: "Cordoalha AMs", valor: 26.30);
    jumperAterramento.quantidade = emendaPerfil.quantidade;


  }

  double energiaModulo(double hsp, double pr ){
    return (hsp * (pr /100) *  moduloFotovoltaico.eficiencia * calcularArea() * 30);
  }

  Map escolherModulo(){
    Map listaModulos ={
    "modulo-Fotovoltaico-0":
        {
            "id": 1,
            "fabricante": "Jinko",
            "fornecedor": "Aldo Solar",
            "modelo": "JKM470N-60HL4-V TIGER NEO 570W 120 CEL. N TYPE MONO 21,78%",
            "altura": 1.903,
            "largura": 1.134,
            "potenciaPico": 570.0,
            "preco": 8600.0,
            "eficiência": 0.2178,
            "observacao": "O critério de escolha é custo por wp: (preco / potenciaPico), o menor valor deve ser escolhido "
        },
     "modulo-Fotovoltaico-1":{
            "id": 2 ,
            "fabricante": "OSDA",
            "fornecedor": "neosolar",
            "modelo": "ODA580-36V-MH",
            "altura": 2.278,
            "largura": 1.134,
            "potenciaPico": 580.0,
            "preco": 869.0 ,
            "eficiência": 0.225,
            "observacao": "O critério de escolha é custo por wp: (preco / potenciaPico), o menor valor deve ser escolhido "
        }
    ,
    };
    //print(listaModulos['modulo-Fotovoltaico'][1]['observacao']);
    Map melhorModulo = {};
    double razao = 99;
    for (var v in listaModulos.values) {
      double razaoTemp = v['preco'] / v['potenciaPico'] ; 
      if(razaoTemp < razao){
        razao = razaoTemp;
        melhorModulo = v;
      }
    }
    return melhorModulo;
  }
  Map escolherMidClamp(){
    Map lista ={
      "mid-clamp-0" :{
          "id": 0,
          "modelo": "GRINT2A",
          "preco" : 3.14
      }
    };
    double menorValor = 99;
    Map midClampEscolhido = {};
    for (var v in lista.values) {
      if(v['preco'] < menorValor){
        menorValor = v['preco'];
        midClampEscolhido = v;
      }
    }
    return midClampEscolhido;
  }
  Trilho escolherTrilho( double comprimentoModulos ){
    Map listaTrilhos = {
      "perfil-0" :{
          "id": 0,
          "modelo": "php-220",
          "comprimento": 2.2,
          "preco" : 53.85
      }
    };
    Map trilhoEscolhido = {};
    double compriTotal = 99;
    int quantFinal = 0;
    for (var v in listaTrilhos.values) {
      int quant = (comprimentoModulos / v['comprimento']).floor() + 1;
      if ((quant * v['comprimento']) < compriTotal ){
        compriTotal = (quant.toDouble() * v['comprimento']);
        quantFinal = quant;
        trilhoEscolhido = v;
      }
    }
    int quantidade = quantFinal ;
    double distanciamentoLateral = ( compriTotal - comprimentoModulos) / 2;
     trilho = Trilho(id: trilhoEscolhido['id'],
            nome: trilhoEscolhido['modelo'],
            valor: trilhoEscolhido['preco'],
            posicao: Posicao.horizontal,);
    trilho.distanciamentoLateral = distanciamentoLateral;
    trilho.comprimento = trilhoEscolhido['comprimento'];
    trilho.quantidade = quantidade * 2;
    return trilho;
  }
  Hook escolherHook( double comprimentoTrilho, String tipoTelhado){
    Map listaHook ={
      "hook-0": {
        "id": 1,
        "modelo": "Telhado Cerâmico",
        "preco": 50.60,
        "tipo": "Cerâmico"
      },
      "hook-1": {
        "id": 2,
        "modelo": "Telhado Metálico",
        "preco": 30.00,
        "tipo": "Metálico"
      },
      "hook-2": {
        "id": 3,
        "modelo": "Telhado Fibrocimento",
        "preco": 31.00,
        "tipo": "Fibrocimento"
      }
    };
    Hook hookEscolhido = Hook(id: 3, nome: "hook Padrão", valor: 0);
    for (var v in listaHook.values) {
      if(v["modelo"] == tipoTelhado){
        hookEscolhido = Hook(id: v['id'],
                    nome: v['modelo'],
                    valor: v['preco']
                   );
      }
    }
    hookEscolhido.definirHooks(comprimentoTrilho);
    return hookEscolhido;
  }
  EndClamp escolherEndClamp(){
    Map endClampLista ={
      'EndClamp-0':{
        'id': 0,
        'modelo': 'GRFN354',
        'preco': 2.85
      }
    };
    EndClamp endClampEscolhido = EndClamp(id: endClampLista['EndClamp-0']['id'], nome: endClampLista['EndClamp-0']['modelo'], valor: endClampLista['EndClamp-0']['preco'] );
    endClampEscolhido.quantidade = 4;
    return endClampEscolhido;
  }
  EmendaPerfil escolherEmendaPerfil(int quantidadeTrilhosLado){
    Map listaEmenda ={
      "Emenda de Perfil":{
        'id': 0,
        'modelo': 'Junção-F1A ',
        'preco': 4.11
      }
    };
    int quantidadeEmendaPerfil = (quantidadeTrilhosLado - 1) *2;
    EmendaPerfil emenda = EmendaPerfil(id: listaEmenda['Emenda de Perfil']['id'], nome: listaEmenda['Emenda de Perfil']['modelo'], valor: listaEmenda['Emenda de Perfil']['preco']);
    emenda._quantidade = quantidadeEmendaPerfil;
    return emenda;
  }
  double calcularArea(){
    return moduloFotovoltaico.altura * moduloFotovoltaico.largura; 
  }
  Map toJsonMap(){
    double valorTotal = moduloFotovoltaico.valorTotal() + trilho.valorTotal() + midClamp.valorTotal() + endClamp.valorTotal() + emendaPerfil.valorTotal() + hook.valorTotal() + grampoAterramento.valorTotal() + clipAterramento.valorTotal() + jumperAterramento.valorTotal();
    Map relatorio = {
      "Modulo Fotovoltaico":{
        'modelo': moduloFotovoltaico.nome,
        'preço unitário': moduloFotovoltaico.valor,
        'quantidade': moduloFotovoltaico.quantidade,
        'preço total': (moduloFotovoltaico.quantidade * moduloFotovoltaico.valor).toStringAsFixed(2)
      },
      "Perfil":{
        'modelo': trilho.nome,
        'preço unitário': trilho.valor,
        'quantidade': trilho.quantidade,
        'preço total': (trilho.quantidade * trilho.valor).toStringAsFixed(2)
      },
      "Mid Clamp":{
        'modelo': midClamp.nome,
        'preço unitário': midClamp.valor,
        'quantidade': midClamp.quantidade,
        'preço total': (midClamp.quantidade * midClamp.valor).toStringAsFixed(2)
      },
      "End Clamp":{
        'modelo': endClamp.nome,
        'preço unitário': endClamp.valor,
        'quantidade': endClamp.quantidade,
        'preço total': (endClamp.quantidade * endClamp.valor).toStringAsFixed(2)
      },
      "Emenda de Perfil":{
        'modelo': emendaPerfil.nome,
        'preço unitário': emendaPerfil.valor,
        'quantidade': emendaPerfil.quantidade,
        'preço total': (emendaPerfil.quantidade * emendaPerfil.valor).toStringAsFixed(2)
      },
      "Hook":{
        'modelo': hook.nome,
        'preço unitário': hook.valor,
        'quantidade': hook.quantidade,
        'preço total': (hook.quantidade * hook.valor).toStringAsFixed(2)
      },
      "Grampo de Aterramento":{
        'modelo': grampoAterramento.nome,
        'preço unitário': grampoAterramento.valor,
        'quantidade': grampoAterramento.quantidade,
        'preço total': (grampoAterramento.quantidade * grampoAterramento.valor).toStringAsFixed(2)
      },
      "Clip de Aterramento":{
        'modelo': clipAterramento.nome,
        'preço unitário': clipAterramento.valor,
        'quantidade': clipAterramento.quantidade,
        'preço total': (clipAterramento.quantidade * clipAterramento.valor).toStringAsFixed(2)
      },
      "Jumper de Aterramento":{
        'modelo': jumperAterramento.nome,
        'preço unitário': jumperAterramento.valor,
        'quantidade': jumperAterramento.quantidade,
        'preço total': (jumperAterramento.quantidade * jumperAterramento.valor).toStringAsFixed(2)
      },
      "área": calcularArea().toStringAsFixed(2),
      "Potencia Pico do Sistema FV": moduloFotovoltaico.potenciaPicoSistemaTotal(),
      "Valor Total": valorTotal
    };
    return relatorio;
  }


}

class SistemaFotovoltaico{
  late double potenciaPico;
  double energiaMediaDiaria;
  double hsp;
  late double perfomanceRatio;
  double inclinacao;
  double sombra;
  late Estrutura estrutura;
  String tipoTelhado;
  SistemaFotovoltaico({
    required this.energiaMediaDiaria,
    required this.hsp,
    required this.inclinacao,
    required this.sombra,
    required this.tipoTelhado
  });
 
  void calcularEstrutura(){
    calcularPP();
    estrutura = Estrutura(potenciaPicoSistema: potenciaPico, tipoTelhado: tipoTelhado);
    estrutura.definirEstrutura();
   /* print("Performance Ratio: $perfomanceRatio");
    print("Potencia Pico necessária: $potenciaPico");
    print("hsp: $hsp");
    print(estrutura.toJsonMap());*/
  }
  void calcularPP(){
    calcularPR();
    potenciaPico = 1000 * (energiaMediaDiaria / (hsp * (perfomanceRatio/100)));
  }
  void calcularPR(){
    perfomanceRatio = 100.00 - (inclinacao + sombra + 22); 
  }
  Map getRelatorio(){
    calcularEstrutura();
    return estrutura.toJsonMap();
  }

  Map getRelatorioDimensionamento(){
    return {
      'Dados Módulo Fotovoltaico' :{
        'Pp(Wp)' : estrutura.moduloFotovoltaico.potenciaPico.toStringAsFixed(0),
        'Área(m²)':estrutura.calcularArea().toStringAsFixed(2),
        'Eficiência': estrutura.moduloFotovoltaico.eficiencia.toString()
      },
      'Pr(Taxa de Desempenho)': "$perfomanceRatio%",
      'Consumo Médio': (energiaMediaDiaria *30).toStringAsFixed(2),
      'Geração de energia por 1 módulo': estrutura.energiaModulo(hsp, perfomanceRatio).toStringAsFixed(2),
      'Geração de energia Sistema' : (estrutura.energiaModulo(hsp, perfomanceRatio) * estrutura.moduloFotovoltaico.quantidade).toStringAsFixed(2),
      'Área do sistema': (estrutura.calcularArea() * estrutura.moduloFotovoltaico.quantidade).toStringAsFixed(2),
      'hsp': hsp.toString(),
      'potencia Pico sistema' : (estrutura.potenciaPicoSistema / 1000)
    };
  }
}
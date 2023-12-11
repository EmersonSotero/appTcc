import 'package:flutter/material.dart';
import 'package:solarpower_tcc/hiveRepository/coon.dart';
import 'package:solarpower_tcc/pages/fatores_page.dart';
import 'package:solarpower_tcc/shared/widgets/custom_drawer.dart';

class RelatoryPage extends StatefulWidget {
  const RelatoryPage({super.key});

  @override
  State<RelatoryPage> createState() => _RelatoryPageState();
}

class _RelatoryPageState extends State<RelatoryPage> {
  //simulando o salvamento no banco de dados
  bool salvando = false;
  Conn conn = Conn();


  dadosConsumoMensal() {
  Map comps = conn.getRelatorio2();
  if (comps.isNotEmpty) {
    String valormedio = conn.mediaMes().toStringAsFixed(2);
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.amberAccent),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Dados de Consumo',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text('Energia Média Mensal',style: TextStyle(fontSize: 15)),
            const SizedBox(height: 8),
            Text(
              "$valormedio kWh/mês",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
  return const SizedBox(
    height: 1,
  );
}

dadosGeracao() {
  Map comps = conn.getRelatorio2();
  if (comps.isNotEmpty) {
    String valormedio = comps['Geração de energia Sistema'];
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.amberAccent),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Dados de Geração',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text('Energia Média Mensal(geração)',style: TextStyle(fontSize: 14)),
            const SizedBox(height: 8),
            Text(
              "$valormedio kWh/mês",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
  return const SizedBox(
    height: 1,
  );
}

dadosPr() {
  Map comps = conn.getRelatorio2();
  if (comps.isNotEmpty) {
    String pr = comps['Pr(Taxa de Desempenho)'];
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.amberAccent),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'PR(Taxa de Desempenho)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              " $pr ",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
  return const SizedBox(
    height: 1,
  );
}

dadosHsp() {
  Map comps = conn.getRelatorio2();
  if (comps.isNotEmpty) {
    String hsp = comps['hsp'];
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.amberAccent),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'HSP Médio Anual',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              "$hsp kWh/m².dia",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
  return const SizedBox(
    height: 1,
  );
}

areaSistema() {
  Map comps = conn.getRelatorio2();
  if (comps.isNotEmpty) {
    String area = comps['Área do sistema'];
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.amberAccent),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Área do sistema',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              " $area m² ",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
  return const SizedBox(
    height: 1,
  );
}


dinheiroGasto() {
  Map comps = conn.getRelatorio();
  Map comps2 = conn.getRelatorio2();
  double potenciaPicodoSistema = comps2['potencia Pico sistema'];
  if (comps.isNotEmpty) {
    double precoTotalEstrutura = comps['Valor Total'];
    double valorTotalSistema = (precoTotalEstrutura + (3680 * potenciaPicodoSistema)) * 1.05;
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.amberAccent),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Preço estimado',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              " R\$ ${valorTotalSistema.toString()} ",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
  return const SizedBox(
    height: 1,
  );
}

payback() {
  Map comps = conn.getRelatorio();
  Map comps2 = conn.getRelatorio2();
  double potenciaPicodoSistema = comps2['potencia Pico sistema'];
  if (comps.isNotEmpty) {
    double mediaMensal = conn.mediaMes();
    double precoTotalEstrutura = comps['Valor Total'];
    double valorPagoMensal = mediaMensal * 0.65;
    double valorTotalSistema = (precoTotalEstrutura + (3680 * potenciaPicodoSistema)) * 1.05;
    double payback = valorTotalSistema/ valorPagoMensal;
    int paybackFinal = payback.floor();
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.amberAccent),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Payback',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              " ${paybackFinal.toString()} meses ",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
  return const SizedBox(
    height: 1,
  );
}

ppSistema() {
  Map comps = conn.getRelatorio2();
  if (comps.isNotEmpty) {
    String ppS = comps['potencia Pico sistema'];
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.amberAccent),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Potência Pico do Sistema',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              " $ppS kWp ",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
  return const SizedBox(
    height: 1,
  );
}


tituloTabelaFoto(){
  Map comps = conn.getRelatorio2();
  if (comps.isNotEmpty){
    return const Center(
          child: Text(
            'Dados Módulo FV',
            style: TextStyle(fontSize: 21),
          ),
        );
  }
  return const SizedBox(
    height: 1,
  );
}
tableDadosFoto() {
  Map comps = conn.getRelatorio2();

  if (comps.isNotEmpty) {
    String area = comps['Dados Módulo Fotovoltaico']['Área(m²)'];
    String pp = comps['Dados Módulo Fotovoltaico']['Pp(Wp)'];
    String eficiencia = comps['Dados Módulo Fotovoltaico']['Eficiência'];

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Table(
          border: TableBorder.all(color: Colors.black),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            _buildTableRow("Pp(Wp)", pp),
            _buildTableRow("Área(m²)", area),
            _buildTableRow("Eficiência", eficiencia),
          ],
        ),
      ),
    );
  }

  return const SizedBox(
    height: 1,
  );
}

TableRow _buildTableRow(String label, String value) {
  return TableRow(
    decoration: const BoxDecoration(color: Colors.white),
    children: [
      TableCell(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            label,
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      TableCell(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            value,
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ],
  );
}


  TableRow fazerLinha(Map componente, String nome) {
    List<String> liCom = [];
    liCom.add(nome);
    liCom.add(componente['modelo'].toString());
    liCom.add("R\$ ${componente['preço unitário'].toString()}");
    liCom.add(componente['quantidade'].toString());
    liCom.add("R\$ ${componente['preço total'].toString()}");

    List<TableCell> listaCells = [];

    liCom.forEach((element) {
      listaCells.add(TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 8), // Espaçamento superior e inferior
          child: Text(
            element,
            style: const TextStyle(fontSize: 13),
            textAlign: TextAlign.center,
          ),
        ),
      ));
    });

    TableRow tableRow = TableRow(
      decoration: const BoxDecoration(color: Colors.white),
      children: listaCells,
    );

    return tableRow;
  }

  Center fazerRelatorio() {
    Map comps = conn.getRelatorio();
    if (comps.isNotEmpty) {
      TableRow table =
          fazerLinha(comps['Modulo Fotovoltaico'], 'Modulo Fotovoltaico');
      TableRow table1 = fazerLinha(comps['Perfil'], 'Perfil');
      TableRow table2 = fazerLinha(comps['Mid Clamp'], 'Mid Clamp');
      TableRow table3 = fazerLinha(comps['End Clamp'], 'End Clamp');
      TableRow table4 =
          fazerLinha(comps['Emenda de Perfil'], 'Emenda de Perfil');
      TableRow table5 = fazerLinha(comps['Hook'], 'Hook');
      TableRow table6 =
          fazerLinha(comps['Grampo de Aterramento'], 'Grampo de Aterramento');
      TableRow table7 =
          fazerLinha(comps['Clip de Aterramento'], 'Clip de Aterramento');
      TableRow table8 =
          fazerLinha(comps['Jumper de Aterramento'], 'Jumper de Aterramento');
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Table(
            columnWidths: const {
              0: FlexColumnWidth(3),
              1: FlexColumnWidth(3),
              2: FlexColumnWidth(2),
              3: FlexColumnWidth(1),
              4: FlexColumnWidth(2),
            },
            border: TableBorder.all(color: Colors.black),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              const TableRow(
                  decoration: BoxDecoration(color: Colors.amberAccent),
                  children: [
                    TableCell(
                        child: Padding(padding:  EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                      "Componente",
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                        )),
                    TableCell(
                        child: Padding(padding:  EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                      "Modelo",
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                        )),
                    TableCell(
                        child: Padding(padding:  EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                      "Preço",
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                        )),
                    TableCell(
                        child: Padding(padding:  EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                      "Qtd.",
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                        )),
                    TableCell(
                        child: Padding(padding:  EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                      "Preço Total",
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                        )),
                  ]),
              table,
              table1,
              table2,
              table3,
              table4,
              table5,
              table6,
              table7,
              table8,
            ],
          ),
        ),
      );
    }
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Text("dados insuficientes"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Relatório"),
        ),
        //backgroundColor: const Color.fromARGB(117, 0, 0, 0),
        drawer: const CustomDrawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: salvando
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Relatório!",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    // Widget de rótulo
                    const SizedBox(
                      height: 20,
                    ),

                    // Campo de entrada de dados com bordas arredondadas
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: Colors.grey, // Cor da borda
                        ),
                      ),
                    ),
                    // Adicione um botão no final da página
                    const SizedBox(
                      height: 30,
                    ),
                    dadosConsumoMensal(),
                    const SizedBox(
                      height: 30,
                    ),
                    dadosGeracao(),
                    const SizedBox(
                      height: 30,
                    ),
                    payback(),
                    const SizedBox(
                      height: 30,
                    ),
                    dadosPr(),
                    const SizedBox(
                      height: 30,
                    ),
                    dadosHsp(),
                    const SizedBox(
                      height: 30,
                    ),
                    ppSistema(),
                    const SizedBox(
                      height: 30,
                    ),
                    areaSistema(),
                    const SizedBox(
                      height: 30,
                    ),
                    fazerRelatorio(),
                    const SizedBox(
                      height: 30,
                    ),
                    tituloTabelaFoto(),
                    const SizedBox(
                      height: 10,
                    ),
                    tableDadosFoto(),const SizedBox(
                      height: 30,
                    ),
                    dinheiroGasto(),
                    const SizedBox(
                      height: 30,
                    ),
                    payback(),
                    


                    
                    
                    
                    
      
                    
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        // Obtenha o BuildContext antes de entrar na função assíncrona
                        final currentContext = context;

                        setState(() {
                          salvando = true;
                        });

                        await Future.delayed(const Duration(milliseconds: 700));

                        // Use a variável local em vez de 'context' na criação do MaterialPageRoute
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          currentContext,
                          MaterialPageRoute(
                            builder: (context) => const FatoresLimitantesPage(),
                          ),
                        );

                        setState(() {
                          salvando = false;
                        });
                      },
                      child: salvando
                          ? const CircularProgressIndicator()
                          : const Text("Salvar"),
                    ),const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          conn.deleteFomumlario();
                          final currentContext = context;
                          
                          await Future.delayed(
                                  const Duration(milliseconds: 700));

                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                currentContext,
                                MaterialPageRoute(
                                  builder: (context) => const RelatoryPage(),
                                ),
                              );
                        },
                        child: const Text("Excluir"))
                  ],
                ),
        ),
      ),
    );
  }
}

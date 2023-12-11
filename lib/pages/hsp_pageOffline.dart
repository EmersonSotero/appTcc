import 'package:flutter/material.dart';
import 'package:solarpower_tcc/hiveRepository/coon.dart';
import 'package:solarpower_tcc/model/dimensionamento.dart';
import 'package:solarpower_tcc/pages/consumo_page.dart';
import 'package:solarpower_tcc/pages/relatorio_page.dart';
import 'package:solarpower_tcc/shared/widgets/custom_drawer.dart';


class HspPageOffline extends StatefulWidget {
  const HspPageOffline({super.key});

  @override
  State<HspPageOffline> createState() => _HspPageOfflineState();
}

class _HspPageOfflineState extends State<HspPageOffline> {
Conn conn = Conn();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("HSP - Horas de sol pleno"),
      ),
      drawer: const CustomDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.signal_wifi_off,
              size: 50,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            const Text(
              "não há conexão com internet",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            const Text(
              "O HSP médio será considerado 4,5 kWh/m².dia",
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 160),
            const SizedBox(
                      height: 160,
                    ),
                    // Adicione um botão no final da página
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              final currentContext = context;
                            

                              await Future.delayed(
                                  const Duration(milliseconds: 700));

                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                currentContext,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ConsumoMensalPage(),
                                ),
                              );

                              
                            },
                            child:
                                const Text("             Voltar             "),
                          ),
                          const SizedBox(
                              width: 10), // Espaçamento entre os botões
                          ElevatedButton(
                            onPressed: () async {
                              final currentContext = context;
                              

                              Map list = conn.getAll();
                              int quant = list.length;
                              if (quant > 16) {
                                SistemaFotovoltaico sys = SistemaFotovoltaico(
                                    energiaMediaDiaria: conn.mediaDiaria(),
                                    hsp: 4.5,
                                    inclinacao: list['inclinacao'],
                                    sombra: list['sombra'],
                                    tipoTelhado: list['tipoTelhado']);
                                conn.saveRelatorio(sys.getRelatorio());
                                conn.saveRelatorio2(sys.getRelatorioDimensionamento());
                              }

                              
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
                            child:const Text("            Avançar           "),
                          ),
                        ],
                      ),
                    ),
          ],
        ),
      ),
    );


  }
}
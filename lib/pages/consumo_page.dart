import 'package:flutter/material.dart';
import 'package:solarpower_tcc/hiveRepository/coon.dart';
import 'package:solarpower_tcc/pages/fatores_page.dart';
import 'package:solarpower_tcc/pages/hsp_page.dart';
import 'package:solarpower_tcc/pages/hsp_pageOffline.dart';
import 'package:solarpower_tcc/shared/widgets/custom_drawer.dart';
import 'package:solarpower_tcc/util/conectado.dart';

class ConsumoMensalPage extends StatefulWidget {
  const ConsumoMensalPage({super.key});

  @override
  State<ConsumoMensalPage> createState() => _ConsumoMensalPageState();
}

class _ConsumoMensalPageState extends State<ConsumoMensalPage> {
  //simulando o salvamento no banco de dados
  bool salvando = false;
  Conn conn = Conn();
  //variaveis de controllers mensais.
  final TextEditingController _janeiroController = TextEditingController();
  final TextEditingController _fevereiroController = TextEditingController();
  final TextEditingController _marcoController = TextEditingController();
  final TextEditingController _abrilController = TextEditingController();
  final TextEditingController _maioController = TextEditingController();
  final TextEditingController _junhoController = TextEditingController();
  final TextEditingController _julhoController = TextEditingController();
  final TextEditingController _agostoController = TextEditingController();
  final TextEditingController _setembroController = TextEditingController();
  final TextEditingController _outubroController = TextEditingController();
  final TextEditingController _novembroController = TextEditingController();
  final TextEditingController _dezembroController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Consumo Mensal"),
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
                      "Insira os dados abaixo !",
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
                      child: TextField(
                        controller: _janeiroController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Janeiro: kwh/mês",
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          border: InputBorder
                              .none, // Remove a borda padrão do TextField
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: Colors.grey, // Cor da borda
                        ),
                      ),
                      child: TextField(
                        controller: _fevereiroController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Fevereiro: kwh/mês",
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          border: InputBorder
                              .none, // Remove a borda padrão do TextField
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: Colors.grey, // Cor da borda
                        ),
                      ),
                      child: TextField(
                        controller: _marcoController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Março: kwh/mês",
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          border: InputBorder
                              .none, // Remove a borda padrão do TextField
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: Colors.grey, // Cor da borda
                        ),
                      ),
                      child: TextField(
                        controller: _abrilController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Abril: kwh/mês",
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          border: InputBorder
                              .none, // Remove a borda padrão do TextField
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: Colors.grey, // Cor da borda
                        ),
                      ),
                      child: TextField(
                        controller: _maioController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Maio: kwh/mês",
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          border: InputBorder
                              .none, // Remove a borda padrão do TextField
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: Colors.grey, // Cor da borda
                        ),
                      ),
                      child: TextField(
                        controller: _junhoController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Junho: kwh/mês",
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          border: InputBorder
                              .none, // Remove a borda padrão do TextField
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: Colors.grey, // Cor da borda
                        ),
                      ),
                      child: TextField(
                        controller: _julhoController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Julho: kwh/mês",
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          border: InputBorder
                              .none, // Remove a borda padrão do TextField
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: Colors.grey, // Cor da borda
                        ),
                      ),
                      child: TextField(
                        controller: _agostoController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Agosto: kwh/mês",
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          border: InputBorder
                              .none, // Remove a borda padrão do TextField
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: Colors.grey, // Cor da borda
                        ),
                      ),
                      child: TextField(
                        controller: _setembroController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Setembro: kwh/mês",
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          border: InputBorder
                              .none, // Remove a borda padrão do TextField
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: Colors.grey, // Cor da borda
                        ),
                      ),
                      child: TextField(
                        controller: _outubroController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Outubro: kwh/mês",
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          border: InputBorder
                              .none, // Remove a borda padrão do TextField
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: Colors.grey, // Cor da borda
                        ),
                      ),
                      child: TextField(
                        controller: _novembroController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Novembro: kwh/mês",
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          border: InputBorder
                              .none, // Remove a borda padrão do TextField
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: Colors.grey, // Cor da borda
                        ),
                      ),
                      child: TextField(
                        controller: _dezembroController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Dezembro: kwh/mês",
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          border: InputBorder
                              .none, // Remove a borda padrão do TextField
                        ),
                      ),
                    ),
                    // Adicione um botão no final da página
                    const SizedBox(
                      height: 10,
                    ),
                    // Adicione um botão no final da página
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              final currentContext = context;


                              setState(() {
                                salvando = true;
                              });

                              await Future.delayed(
                                  const Duration(milliseconds: 700));

                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                currentContext,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const FatoresLimitantesPage(),
                                ),
                              );

                              setState(() {
                                salvando = false;
                              });
                            },
                            child:
                                const Text("             Voltar             "),
                          ),
                          const SizedBox(
                              width: 10), // Espaçamento entre os botões
                          ElevatedButton(
                            onPressed: () async {
                              final currentContext = context;

                              List li = [];
                              li.add(double.parse(_janeiroController.text));
                              li.add(double.parse(_fevereiroController.text));
                              li.add(double.parse(_marcoController.text));
                              li.add(double.parse(_abrilController.text));
                              li.add(double.parse(_maioController.text));
                              li.add(double.parse(_junhoController.text));
                              li.add(double.parse(_julhoController.text));
                              li.add(double.parse(_agostoController.text));
                              li.add(double.parse(_setembroController.text));
                              li.add(double.parse(_outubroController.text));
                              li.add(double.parse(_novembroController.text));
                              li.add(double.parse(_dezembroController.text));

                              conn.pageConsumo(li);

                              setState(() {
                                salvando = true;
                              }); 
                              
                              Conectado conectado = Conectado();
                              Future<bool> conexao = conectado.getConexao();
                              await Future.delayed(
                                  const Duration(milliseconds: 700));

                              
                              conexao.then((value) {
                                if (value) {
                                  //tira tela e coloca uma nova
                                  Navigator.push(
                                      currentContext,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HspPage()));
                                } else {
                                  //navegação
                                  //tira tela e coloca uma nova
                                  Navigator.push(
                                      currentContext,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HspPageOffline()));
                                }
                              }).catchError((onError) {
                        
                                Navigator.push(
                                    currentContext,
                                    MaterialPageRoute(
                                        builder: (context) => const HspPage()));
                              });

                              // ignore: use_build_context_synchronously
                            
                              setState(() {
                                salvando = false;
                              });
                            },
                            child: salvando
                                ? const CircularProgressIndicator()
                                : const Text("            Avançar           "),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

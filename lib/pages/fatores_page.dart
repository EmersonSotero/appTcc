import 'package:flutter/material.dart';
import 'package:solarpower_tcc/hiveRepository/coon.dart';
import 'package:solarpower_tcc/pages/consumo_page.dart';
import 'package:solarpower_tcc/repositories/boxlist_repository.dart';
import 'package:solarpower_tcc/shared/widgets/custom_drawer.dart';


const List<String> listaTelhado = ['Telhado Cerâmico', 'Telhado Metálico', 'Telhado Fibrocimento'];
//Tela main page
class FatoresLimitantesPage extends StatefulWidget {
  const FatoresLimitantesPage({super.key});

  @override
  State<FatoresLimitantesPage> createState() => _FatoresLimitantesPageState();
}

class _FatoresLimitantesPageState extends State<FatoresLimitantesPage> {
  //simulando o salvamento no banco de dados
  bool salvando = false;

  var boxRepository = BoxlistRepository();
  List<String> boxlist = BoxlistRepository().retornaBoxlist();
  var boxlistSelecionadas = [];

  Conn conn = Conn();
  
  String  dropdownValue = listaTelhado.first;

  final TextEditingController _larguradotelhadoController =
      TextEditingController();
  final TextEditingController _comprimentodoTelhadoController =
      TextEditingController();
  final TextEditingController _porcentagemdesombraaodiaController =
      TextEditingController();
  final TextEditingController _inclinacaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Fatores Limitantes"),
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
                        controller: _larguradotelhadoController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Largura do telhado:",
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
                        controller: _comprimentodoTelhadoController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Comprimento do telhado:",
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
                        controller: _porcentagemdesombraaodiaController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Porcentagem de sombra ao dia:",
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
                        controller: _inclinacaoController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Inclinação:",
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          border: InputBorder
                              .none, // Remove a borda padrão do TextField
                        ),
                      ),
                    ),
                    /*const TextLabel(
                      texto: "Marque as caixas abaixo !",
                    ),*/
                    const SizedBox(
                      height: 10,
                    ),
                    //Column CheckboxListTile
                    DropdownButton<String>(
                      value: dropdownValue,
                      onChanged: (String? value) {
                          setState(() {
                            dropdownValue = value!;
                          });
                          
                        },
                        items: listaTelhado.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        
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

                              conn.pageFatores(
                                  double.parse(
                                      _comprimentodoTelhadoController.text),
                                  double.parse(
                                      _larguradotelhadoController.text),
                                  double.parse(
                                      _porcentagemdesombraaodiaController.text),
                                  double.parse(_inclinacaoController.text),
                                  dropdownValue
                                  );

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

                              conn.pageFatores(
                                  double.parse(
                                      _comprimentodoTelhadoController.text),
                                  double.parse(
                                      _larguradotelhadoController.text),
                                  double.parse(
                                      _porcentagemdesombraaodiaController.text),
                                  double.parse(_inclinacaoController.text),
                                  dropdownValue);

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
                                      const ConsumoMensalPage(),
                                ),
                              );

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

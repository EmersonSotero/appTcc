import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:solarpower_tcc/hiveRepository/coon.dart';
import 'package:solarpower_tcc/model/dimensionamento.dart';
import 'package:solarpower_tcc/pages/consumo_page.dart';
import 'package:solarpower_tcc/pages/relatorio_page.dart';
import 'package:solarpower_tcc/shared/widgets/custom_drawer.dart';

import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

class HspPage extends StatefulWidget {
  const HspPage({super.key});

  @override
  State<HspPage> createState() => _HspPageState();
}

class _HspPageState extends State<HspPage> {
  //simulando o salvamento no banco de dados
  bool salvando = false;

  Conn conn = Conn();

  final TextEditingController _cepController = TextEditingController();
  String _latitude = "";
  String _longitude = "";
  String _hsp = "";
  String _cidade = "";
  late double mediaHsp;
  Future<void> _getCoordinates() async {
    try {
      final List<Location> locations =
          await locationFromAddress(_cepController.text);
      if (locations.isNotEmpty) {
        final double latitude = locations.first.latitude;
        final double longitude = locations.first.longitude;
        setState(() {
          _latitude = "Latitude: $latitude";
          _longitude = "Longitude: $longitude";
        });

        final String url =
            "http://www.cresesb.cepel.br/index.php?section=sundata&latitude_dec=$latitude&latitude=$latitude&hemi_lat=0&longitude_dec=$longitude&longitude=$longitude&formato=1&lang=pt";

        final response = await http.get(Uri.parse(url));
        final document =
            parse(utf8.decode(response.bodyBytes, allowMalformed: true));
        final media = document.getElementsByTagName("strong")[35].text;
        final cidade = document.querySelector(
            "#tb_sundata > tbody > tr:nth-child(2) > td:nth-child(3)");

        if (kDebugMode) {
          print(media);
        }
        if (kDebugMode) {
          print(cidade?.text);
        }

        mediaHsp = double.parse(media.replaceAll(',', '.'));
        if (kDebugMode) {
          print(" essa é a media: $mediaHsp");
        }

        setState(() {
          _hsp = "HSP Médio Anual: $media [kWh/m².dia]";
          _cidade = "Cidade: ${cidade?.text}";
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("HSP - Horas de sol pleno"),
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
                      "Insira o endereço da Instalação!",
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
                        controller: _cepController,
                        decoration: const InputDecoration(
                          hintText: "Endereço ou CEP:",
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: _getCoordinates,
                      child: const Text("Buscar HSP"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      _cidade,
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      _hsp,
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      _latitude,
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      _longitude,
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    // Adicione um botão no final da página
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
                              if (_hsp.isNotEmpty) {
                                conn.pageHsp(double.parse(_hsp));
                              }
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
                            child:
                                const Text("             Voltar             "),
                          ),
                          const SizedBox(
                              width: 10), // Espaçamento entre os botões
                          ElevatedButton(
                            onPressed: () async {
                              final currentContext = context;
                              if (_hsp.isNotEmpty) {
                                conn.pageHsp(mediaHsp);
                              }

                              Map list = conn.getAll();
                              int quant = list.length;
                              if (quant > 16) {
                                SistemaFotovoltaico sys = SistemaFotovoltaico(
                                    energiaMediaDiaria: conn.mediaDiaria(),
                                    hsp: list['hsp'],
                                    inclinacao: list['inclinacao'],
                                    sombra: list['sombra'],
                                    tipoTelhado: list['tipoTelhado']);
                                conn.saveRelatorio(sys.getRelatorio());
                                conn.saveRelatorio2(sys.getRelatorioDimensionamento());
                              }

                              setState(() {
                                salvando = true;
                              });

                              await Future.delayed(
                                  const Duration(milliseconds: 700));

                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                currentContext,
                                MaterialPageRoute(
                                  builder: (context) => const RelatoryPage(),
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
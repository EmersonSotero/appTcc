import 'package:flutter/material.dart';
import 'package:solarpower_tcc/pages/hsp_page.dart';
import 'package:solarpower_tcc/pages/hsp_pageOffline.dart';
import 'package:solarpower_tcc/pages/login_page.dart';
import 'package:solarpower_tcc/pages/fatores_page.dart';
import 'package:solarpower_tcc/pages/consumo_page.dart';
import 'package:solarpower_tcc/pages/relatorio_page.dart';
import 'package:solarpower_tcc/pages/sobre_page.dart';
import 'package:solarpower_tcc/util/conectado.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: const Color.fromARGB(220, 0, 0, 0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InkWell(
                child: Center(
                  child: UserAccountsDrawerHeader(
                      decoration: BoxDecoration(color: Colors.amber),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/user_profile.png"),
                      ),
                      accountName: Text("Admin Tester"),
                      accountEmail: Text("admintester@email.com")),
                ),
              ),
              InkWell(
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    child: const Row(
                      children: [
                        Icon(Icons.factory_sharp, color: Colors.amber),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Fatores limitantes",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )),
                onTap: () {
                  //navegação
                  Navigator.pop(context); //tira tela e coloca uma nova
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FatoresLimitantesPage()));
                },
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    child: const Row(
                      children: [
                        Icon(
                          Icons.content_paste_go_outlined,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Consumo mensal",
                            style: TextStyle(color: Colors.white)),
                      ],
                    )),
                onTap: () {
                  //navegação
                  Navigator.pop(context); //tira tela e coloca uma nova
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ConsumoMensalPage()));
                },
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    child: const Row(
                      children: [
                        Icon(
                          Icons.h_mobiledata_rounded,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "HSP",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )),
                onTap: () {

                  Conectado conectado = Conectado();
                  Future<bool> conexao = conectado.getConexao();
                  conexao.then((value) {
                    if(value){
                      Navigator.pop(context); //tira tela e coloca uma nova
                     Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const HspPageOffline()));
                    }else{
                      //navegação
                  Navigator.pop(context); //tira tela e coloca uma nova
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const HspPageOffline()));
                    }
                  }).catchError((onError){
                    Navigator.pop(context); //tira tela e coloca uma nova
                     Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const HspPage()));
                  });

                  
                },
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    child: const Row(
                      children: [
                        Icon(
                          Icons.real_estate_agent_rounded,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Relatório",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )),
                onTap: () {
                  //navegação
                  Navigator.pop(context); //tira tela e coloca uma nova
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RelatoryPage()));
                },
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    child: const Row(
                      children: [
                        Icon(
                          Icons.info,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Sobre",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )),
                onTap: () {
                  //navegação
                  Navigator.pop(context); //tira tela e coloca uma nova
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InfoSobrePage()));
                },
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    child: const Row(
                      children: [
                        Icon(
                          Icons.exit_to_app,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Sair", style: TextStyle(color: Colors.white)),
                      ],
                    )),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext bc) {
                        return AlertDialog(
                          alignment: Alignment.center,
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          title: const Text(
                            "Exit to app!",
                            textAlign: TextAlign.center,
                          ),
                          content: const Wrap(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text("Deseja realmente sair do aplicativo ?"),
                            ],
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Não")),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) =>
                                              const LoginPage()));
                                },
                                child: const Text("Sim")),
                          ],
                        );
                      });
                },
              ),
            ],
          ),
        ));
  }
}

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:solarpower_tcc/pages/fatores_page.dart';
import 'package:solarpower_tcc/shared/widgets/custom_drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoSobrePage extends StatefulWidget {
  const InfoSobrePage({super.key});

  @override
  State<InfoSobrePage> createState() => _InfoSobrePageState();
}

class _InfoSobrePageState extends State<InfoSobrePage> {
  bool salvando = false;

  // URLs das redes sociais (substitua pelos seus links)
  // Fundador Davyd
  final String linkedinUrlDavyd =
      "https://www.linkedin.com/in/davyd-c-b41b5b99/";
  final String githubUrlDavyd = "https://github.com/davydcristiano";

  // Fundador Cauã
  final String linkedinUrlCaua =
      "https://www.linkedin.com/in/cauã-rossi-ferreira-6b2b2a208/";
  final String githubUrlCaua = "https://github.com/cauarossi";

  // Fundador Emerson
  final String linkedinUrlEmerson =
      "https://www.linkedin.com/in/emerson-sotero-522009247/";
  final String githubUrlEmerson = "https://github.com/emersonsotero";

  // Fundador Ezio
  final String linkedinUrlEzio = "https://www.linkedin.com/in/eziovieira/";
  final String githubUrlEzio = "https://github.com/ezim10g";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sobre"),
        ),
        drawer: const CustomDrawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: salvando
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Desenvolvedores!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    // Adicionando o Card com informações do fundador
                    Padding(
                      padding:
                          const EdgeInsets.all(8.0), // Adiciona o padding aqui
                      child: Card(
                        elevation: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Adiciona esta linha para alinhar à esquerda
                          children: [
                            const ListTile(
                              leading: Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                // Adiciona o padding aqui
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(
                                    "https://avatars.githubusercontent.com/u/53920878?s=400&u=c64c838fccc8d0b3bd26d0c39e3823365668b38f&v=4",
                                  ),
                                ),
                              ),
                              title: Text("Davyd Cristiano"),
                            ),
                            // Adiciona os ícones de redes sociais clicáveis
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              // Centraliza os ícones
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: GestureDetector(
                                    onTap: () => _launchURL(linkedinUrlDavyd),
                                    child:
                                        const FaIcon(FontAwesomeIcons.linkedin),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () => _launchURL(githubUrlDavyd),
                                  child: const FaIcon(FontAwesomeIcons.github),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Adicionando o Card com informações do fundador
                    Padding(
                      padding:
                          const EdgeInsets.all(8.0), // Adiciona o padding aqui
                      child: Card(
                        elevation: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const ListTile(
                              leading: Padding(
                                padding: EdgeInsets.only(top: 15.0),
                                // Adiciona o padding aqui
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(
                                    "https://avatars.githubusercontent.com/u/114304991?v=4",
                                  ), // Substitua pela URL da imagem do fundador
                                ),
                              ),
                              title: Text("Cauã Rossi"),
                            ),
                            // Adicione os ícones de redes sociais clicáveis
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // Centraliza os ícones
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: GestureDetector(
                                    onTap: () => _launchURL(linkedinUrlCaua),
                                    child:
                                        const FaIcon(FontAwesomeIcons.linkedin),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () => _launchURL(githubUrlCaua),
                                  child: const FaIcon(FontAwesomeIcons.github),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Adicionando o Card com informações do fundador
                    Padding(
                      padding:
                          const EdgeInsets.all(8.0), // Adiciona o padding aqui
                      child: Card(
                        elevation: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const ListTile(
                              leading: Padding(
                                padding: EdgeInsets.only(top: 15.0),
                                // Adiciona o padding aqui
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(
                                    "https://avatars.githubusercontent.com/u/113872809?v=4",
                                  ), // Substitua pela URL da imagem do fundador
                                ),
                              ),
                              title: Text("Emerson Sotero"),
                            ),
                            // Adicione os ícones de redes sociais clicáveis
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // Centraliza os ícones
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: GestureDetector(
                                    onTap: () => _launchURL(linkedinUrlEmerson),
                                    child:
                                        const FaIcon(FontAwesomeIcons.linkedin),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () => _launchURL(githubUrlEmerson),
                                  child: const FaIcon(FontAwesomeIcons.github),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Adicionando o Card com informações do fundador
                    Padding(
                      padding:
                          const EdgeInsets.all(8.0), // Adiciona o padding aqui
                      child: Card(
                        elevation: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const ListTile(
                              leading: Padding(
                                padding: EdgeInsets.only(top: 15.0),
                                // Adiciona o padding aqui
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(
                                    "https://avatars.githubusercontent.com/u/91918377?v=4",
                                  ), // Substitua pela URL da imagem do fundador
                                ),
                              ),
                              title: Text("Ezio Vieira"),
                            ),
                            // Adicione os ícones de redes sociais clicáveis
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // Centraliza os ícones
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: GestureDetector(
                                    onTap: () => _launchURL(linkedinUrlEzio),
                                    child:
                                        const FaIcon(FontAwesomeIcons.linkedin),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () => _launchURL(githubUrlEzio),
                                  child: const FaIcon(FontAwesomeIcons.github),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () async {
                        final currentContext = context;

                        setState(() {
                          salvando = true;
                        });

                        await Future.delayed(const Duration(milliseconds: 700));

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
                          : const Text("Voltar"),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  // Função para abrir URLs
  _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Não foi possível abrir $url';
    }
  }
}

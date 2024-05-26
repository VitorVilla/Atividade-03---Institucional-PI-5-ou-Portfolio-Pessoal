import 'package:flutter/material.dart';
import 'package:portifolio/features/utils/buttonNavegation.dart';
import 'package:portifolio/features/utils/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  int selectedIndex = 1;

  // Método para abrir o link do LinkedIn
  void _launchLinkedIn() async {
    const url = 'https://www.linkedin.com/in/vitorvilla/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível abrir o link $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Sobre Mim'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Me chamo Vitor, tenho 20 anos e sou estudante do 5º semestre '
                  'de desenvolvimento de software multiplataforma (FATEC ARARAS). Trabalho na área de desenvolvimento, '
                  'atuando como back-end. Tenho conhecimento em tecnologias como Java, Spring Boot, Git, entre outras. '
                  'Pretendo evoluir como profissional buscando melhores oportunidades tanto de aprendizagem como profissionalmente.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _launchLinkedIn,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Text('Meu LinkedIn'),
                ),
              ],
            ),
          ),
        ),
        drawer: const DrawerNavegation(),
        bottomNavigationBar: ButtonNavegation(
          selectedIndex: selectedIndex,
          onItemSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ));
  }
}

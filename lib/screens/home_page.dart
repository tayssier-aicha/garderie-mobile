
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String page = 'Accueil';

  final List<Map<String, String>> activites = [
    {
      'titre': 'Dessin',
      'description': 'Les enfants dessinent et colorient.',
      'emoji': '🎨',
    },
    {
      'titre': 'Lecture',
      'description': 'Découverte de petites histoires.',
      'emoji': '📚',
    },
    {
      'titre': 'Musique',
      'description': 'Chansons et jeux musicaux.',
      'emoji': '🎵',
    },
    {
      'titre': 'Jeux éducatifs',
      'description': 'Apprendre en jouant ensemble.',
      'emoji': '🧩',
    },
    {
      'titre': 'Activités sportives',
      'description': 'Bouger et s’amuser en groupe.',
      'emoji': '⚽',
    },
  ];

  void choisirPage(String nouvellePage) {
    setState(() {
      page = nouvellePage;
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(page == 'Activités' ? 'Nos activités' : 'Ma Garderie'),
        backgroundColor: const Color(0xFFB9DDF8),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Ma Garderie'),
              accountEmail: Text('Bienvenue chez nous !'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('🧸', style: TextStyle(fontSize: 32)),
              ),
              decoration: BoxDecoration(
                color: Color(0xFF83BCEB),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Accueil'),
              onTap: () => choisirPage('Accueil'),
            ),
            ListTile(
              leading: const Icon(Icons.toys),
              title: const Text('Activités'),
              onTap: () => choisirPage('Activités'),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('À propos'),
              onTap: () => choisirPage('À propos'),
            ),
          ],
        ),
      ),
      body: page == 'À propos'
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Text(
                  'Ma Garderie est une application qui présente '
                  'les activités proposées aux enfants.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          : page == 'Accueil'
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Text(
                      'Bienvenue à Ma Garderie ! 🧸',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: activites.length,
                  itemBuilder: (context, index) {
                    final activite = activites[index];

                    return Card(
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: Text(
                          activite['emoji']!,
                          style: const TextStyle(fontSize: 32),
                        ),
                        title: Text(
                          activite['titre']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(activite['description']!),
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Activité sélectionnée : '
                                '${activite['titre']}',
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF83BCEB),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Nouvelle activité'),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'MyDrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var Pays = [
    {
      'Pays': 'Tunisie',
      'Capitale': 'Tunis',
      'Population': '12 Millions',
      'Langue': 'Arabe',
      'image': 'tn.png'
    },
    {
      'Pays': 'Maroc',
      'Capitale': 'Rabat',
      'Population': '38 Millions',
      'Langue': 'Arabe',
      'image': 'ma.png'
    },
    {
      'Pays': 'USA',
      'Capitale': 'Washington',
      'Population': '332 Millions',
      'Langue': 'Anglais',
      'image': 'us.png'
    },
    {
      'Pays': 'France',
      'Capitale': 'Paris',
      'Population': '68 Millions',
      'Langue': 'Francais',
      'image': 'fr.png'
    },
    {
      'Pays': 'Brésil',
      'Capitale': 'Brasilia',
      'Population': '214 Millions',
      'Langue': 'Portuguese',
      'image': 'br.png'
    }
  ];

  Map<String, String>? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atlas Monde'),
        backgroundColor: Colors.blue, 
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("FloatingActionButton pressed");
          print(Pays[0]["Pays"]);
        },
        child: const Icon(Icons.cloud),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 24),
          const Text(
            'Cliquer sur un Pays',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (var pays in Pays)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCountry = pays;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.blue, 
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        pays["Pays"]!,
                        style: const TextStyle(
                          color: Colors.white, 
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          if (selectedCountry != null) ...[
            CountryInfo(
                text: 'Capitale: ${selectedCountry!["Capitale"]}',
                color: Colors.green),
            CountryInfo(
                text: 'Population: ${selectedCountry!["Population"]}',
                color: Colors.pink),
            CountryInfo(
                text: 'Langue: ${selectedCountry!["Langue"]}',
                color: Colors.orange),
            const SizedBox(height: 8),
            Image.asset(
              'assets/images/${selectedCountry!["image"]}',
              height: 200,
            ),
          ],
        ],
      ),
    );
  }
}

class CountryInfo extends StatelessWidget {
  final String text;
  final Color color;

  const CountryInfo({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(color: color, fontSize: 16),
      ),
    );
  }
}

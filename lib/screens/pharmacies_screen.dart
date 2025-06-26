import 'package:flutter/material.dart';
import 'package:flutter_projets/screens/pharmacy_medicaments_screen.dart';

class PharmaciesScreen extends StatefulWidget {
  @override
  _PharmaciesScreenState createState() => _PharmaciesScreenState();
}

class _PharmaciesScreenState extends State<PharmaciesScreen> {
  // Api de geolocalisation OpenStreetMap
  final API = "http://wiki.openstreetmap.org/wiki/API";
  //liste des pharmacies
  final List<Map<String, dynamic>> pharmacies = [
    {
      'id': '1',
      'name': 'Happy Ekoumdoum',
      'distance': '0.8 km',
      'address': 'Carrefour Amitie, Yaounde',
      'rating': 4.8,
      'open': true,
      'image': 'assets/images/ads5.jpg',
      // Médicaments spécifiques à cette pharmacie
      'medicaments': [
        {
          'id': 'med1',
          'name': 'Doliprane 1000mg',
          'description': 'Boîte de 16 comprimés',
          'price': 5.99,
          'image': 'assets/products/Amoxil.png',
          'category': 'Douleur',
        },
        {
          'id': 'med2',
          'name': 'Vitamine C',
          'description': '30 comprimés effervescents',
          'price': 8.50,
          'image': 'assets/products/Robitussin.png',
          'category': 'Vitamines',
        },
        {
          'id': 'med7',
          'name': 'Aspirine',
          'description': 'Boîte de 30 comprimés',
          'price': 2.80,
          'image': 'assets/products/Lipitor.png',
          'category': 'Douleur',
        },
        {
          'id': 'med7',
          'name': 'Aspirine',
          'description': 'Boîte de 30 comprimés',
          'price': 2.80,
          'image': 'assets/products/Lipitor.png',
          'category': 'Douleur',
        },
        {
          'id': 'med3',
          'name': 'Biafine',
          'description': 'Crème 100g',
          'price': 7.20,
          'image': 'assets/products/Lipitor.png',
          'category': 'Soins',
        },
      ],
    },
    {
      'id': '2',
      'name': 'Pharmacie Chapelle Obili',
      'distance': '1.2 km',
      'address': 'Byem-Assi, Yaounde',
      'rating': 4.5,
      'open': false,
      'image': 'assets/images/ads1.jpeg',
      // Médicaments spécifiques à cette pharmacie
      'medicaments': [
        {
          'id': 'med3',
          'name': 'Biafine',
          'description': 'Crème 100g',
          'price': 7.20,
          'image': 'assets/products/Lipitor.png',
          'category': 'Soins',
        },
        {
          'id': 'med4',
          'name': 'Smecta',
          'description': 'Sachets - 10 unités',
          'price': 6.40,
          'image': 'assets/products/Lantus.png',
          'category': 'Digestion',
        },
        {
          'id': 'med5',
          'name': 'Paracétamol',
          'description': 'Boîte de 20 comprimés',
          'price': 3.50,
          'image': 'assets/products/Amoxil.png',
          'category': 'Douleur',
        },
      ],
    },
    {
      'id': '3',
      'name': 'Pharmacie Soleil',
      'distance': '1.5 km',
      'address': 'Marche Centrale, Yaounde',
      'rating': 4.9,
      'open': true,
      'image': 'assets/images/ads3.jpg',
      // Médicaments spécifiques à cette pharmacie
      'medicaments': [
        {
          'id': 'med5',
          'name': 'Paracétamol',
          'description': 'Boîte de 20 comprimés',
          'price': 3.50,
          'image': 'assets/products/Amoxil.png',
          'category': 'Douleur',
        },
        {
          'id': 'med3',
          'name': 'Biafine',
          'description': 'Crème 100g',
          'price': 7.20,
          'image': 'assets/products/Lipitor.png',
          'category': 'Soins',
        },
        {
          'id': 'med4',
          'name': 'Smecta',
          'description': 'Sachets - 10 unités',
          'price': 6.40,
          'image': 'assets/products/Lantus.png',
          'category': 'Digestion',
        },
      ],
    },
    {
      'id': '4',
      'name': 'Pharmacie Odza',
      'distance': '1.5 km',
      'address': 'Odza, Yaounde',
      'rating': 4.9,
      'open': false,
      'image': 'assets/images/ads4.jpeg',
      // Médicaments spécifiques à cette pharmacie
      'medicaments': [
        {
          'id': 'med6',
          'name': 'Ibuprofène',
          'description': 'Boîte de 12 comprimés',
          'price': 4.20,
          'image': 'assets/products/Robitussin.png',
          'category': 'Douleur',
        },
        {
          'id': 'med5',
          'name': 'Paracétamol',
          'description': 'Boîte de 20 comprimés',
          'price': 3.50,
          'image': 'assets/products/Amoxil.png',
          'category': 'Douleur',
        }, {
          'id': 'med7',
          'name': 'Aspirine',
          'description': 'Boîte de 30 comprimés',
          'price': 2.80,
          'image': 'assets/products/Lipitor.png',
          'category': 'Douleur',
        },
      ],
    },
    {
      'id': '5',
      'name': 'Pharmacie Nouvelle Route Omnisport',
      'distance': '1.5 km',
      'address': 'Omnisport, Yaounde',
      'rating': 4.9,
      'open': true,
      'image': 'assets/images/ads2.jpg',
      // Médicaments spécifiques à cette pharmacie
      'medicaments': [
        {
          'id': 'med7',
          'name': 'Aspirine',
          'description': 'Boîte de 30 comprimés',
          'price': 2.80,
          'image': 'assets/products/Lipitor.png',
          'category': 'Douleur',
        },
        {
          'id': 'med3',
          'name': 'Biafine',
          'description': 'Crème 100g',
          'price': 7.20,
          'image': 'assets/products/Lipitor.png',
          'category': 'Soins',
        },
        {
          'id': 'med4',
          'name': 'Smecta',
          'description': 'Sachets - 10 unités',
          'price': 6.40,
          'image': 'assets/products/Lantus.png',
          'category': 'Digestion',
        },
        {
          'id': 'med1',
          'name': 'Doliprane 1000mg',
          'description': 'Boîte de 16 comprimés',
          'price': 5.99,
          'image': 'assets/products/Amoxil.png',
          'category': 'Douleur',
        },
        {
          'id': 'med2',
          'name': 'Vitamine C',
          'description': '30 comprimés effervescents',
          'price': 8.50,
          'image': 'assets/products/Robitussin.png',
          'category': 'Vitamines',
        },
      ],
    },
  ];

  List<Map<String, dynamic>> filteredPharmacies = [];
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredPharmacies = List.from(pharmacies);
    _searchController.addListener(_filterPharmacies);
  }

  void _filterPharmacies() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredPharmacies = List.from(pharmacies);
      } else {
        filteredPharmacies = pharmacies.where((pharmacy) {
          return pharmacy['name'].toLowerCase().contains(query) ||
              pharmacy['address'].toLowerCase().contains(query);
        }).toList();
      }
    });
  }

  void _startSearch() {
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearch() {
    setState(() {
      _isSearching = false;
      _searchController.clear();
      filteredPharmacies = List.from(pharmacies);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          // Filtres rapides
          if (!_isSearching) ...[
            Container(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: [
                  FilterChip(
                    label: Text('Ouvert maintenant'),
                    selected: true,
                    onSelected: (bool value) {},
                  ),
                  SizedBox(width: 8),
                  FilterChip(
                    label: Text('Moins de 1km'),
                    selected: false,
                    onSelected: (bool value) {},
                  ),
                  SizedBox(width: 8),
                  FilterChip(
                    label: Text('24h/24'),
                    selected: false,
                    onSelected: (bool value) {},
                  ),
                ],
              ),
            ),
          ],

          // Liste des pharmacies
          Expanded(
            child: filteredPharmacies.isEmpty
                ? Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Aucune pharmacie trouvée',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
            )
                : ListView.builder(
              itemCount: filteredPharmacies.length,
              itemBuilder: (context, index) {
                final pharmacy = filteredPharmacies[index];
                return _buildPharmacyCard(context, pharmacy);
              },
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.green[700],
      title: _isSearching
          ? TextField(
        controller: _searchController,
        autofocus: true,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Rechercher une pharmacie...',
          hintStyle: TextStyle(color: Colors.white70),
          border: InputBorder.none,
        ),
      )
          : Text('Pharmacies', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      actions: _isSearching
          ? [
        IconButton(
          icon: Icon(Icons.clear, color: Colors.white),
          onPressed: _stopSearch,
        ),
      ]
          : [
        IconButton(
          icon: Icon(Icons.search, color: Colors.white),
          onPressed: _startSearch,
        ),
        IconButton(
          icon: Icon(Icons.filter_list, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildPharmacyCard(BuildContext context, Map<String, dynamic> pharmacy) {
    return Card(
      margin: EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PharmacyMedicamentsScreen(
                pharmacyId: pharmacy['id'],
                pharmacyName: pharmacy['name'],
                pharmacyMedicaments: List.from(pharmacy['medicaments']),
              ),
            ),
          );
        },
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image de la pharmacie
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(pharmacy['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 16),
              // Informations
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pharmacy['name'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            pharmacy['address'],
                            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: pharmacy['open'] ? Colors.green[50] : Colors.red[50],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            pharmacy['open'] ? 'Ouvert' : 'Fermé',
                            style: TextStyle(
                              color: pharmacy['open'] ? Colors.green : Colors.red,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.star, color: Colors.amber, size: 18),
                        SizedBox(width: 4),
                        Text(
                          pharmacy['rating'].toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Distance: ${pharmacy['distance']}',
                      style: TextStyle(color: Colors.blue[700]),
                    ),
                  ],
                ),
              ),
              // Bouton favori
              IconButton(
                icon: Icon(Icons.favorite_border, color: Colors.grey),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
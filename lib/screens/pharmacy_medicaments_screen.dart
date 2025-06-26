import 'package:flutter/material.dart';

class PharmacyMedicamentsScreen extends StatefulWidget {
  final String pharmacyId;

  const PharmacyMedicamentsScreen({Key? key, required this.pharmacyId}) : super(key: key);

  @override
  _PharmacyMedicamentsScreenState createState() => _PharmacyMedicamentsScreenState();
}

class _PharmacyMedicamentsScreenState extends State<PharmacyMedicamentsScreen> {
  late Map<String, dynamic> pharmacy;
  List<Map<String, dynamic>> medicaments = [];

  @override
  void initState() {
    super.initState();
    // En production, vous récupéreriez les données à partir de l'ID de la pharmacie
    _loadPharmacyData();
  }

  void _loadPharmacyData() {
    // Données simulées - À remplacer par une requête API
    pharmacy = {
      'id': widget.pharmacyId,
      'name': 'Pharmacie Happy Ekoumdoum',
      'address': 'Yaounde, Awaie',
      'phone': '+237 6 80 45 67 89',
      'open': true,
      'rating': 4.8,
      'distance': '0.8 km',
      'image': 'assets/images/ads5.jpg',
      'description': 'Pharmacie ouverte 7j/7 24H/24',
    };
    medicaments = [
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
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text(pharmacy['name'], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [
          // En-tête de la pharmacie
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.green[50],
            child: Row(
              children: [
                // Image de la pharmacie
                Container(
                  width: 80,
                  height: 80,
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
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 16, color: Colors.grey),
                          SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              pharmacy['address'],
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.phone, size: 16, color: Colors.grey),
                          SizedBox(width: 4),
                          Text(pharmacy['phone'], style: TextStyle(color: Colors.grey[600])),
                        ],
                      ),
                      SizedBox(height: 4),
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
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          SizedBox(width: 4),
                          Text(pharmacy['rating'].toString()),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Barre de recherche et filtres
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Rechercher un médicament...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // Liste des médicaments
          Expanded(
            child: ListView.builder(
              itemCount: medicaments.length,
              itemBuilder: (context, index) {
                return _buildMedicamentCard(medicaments[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMedicamentCard(Map<String, dynamic> medicament) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image du médicament
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(medicament['image']),
                  fit: BoxFit.contain,
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
                    medicament['name'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    medicament['description'],
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          medicament['category'],
                          style: TextStyle(
                            color: Colors.blue[700],
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Spacer(),
                      Text(
                        '${medicament['price']}k fcfa',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[700],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Boutons d'action
            Column(
              children: [
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(8),
                  ),
                  child: Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
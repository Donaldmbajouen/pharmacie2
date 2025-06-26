import 'package:flutter/material.dart';
import 'package:flutter_projets/screens/pharmacy_medicaments_screen.dart';

class PharmaciesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> pharmacies = [
    {
      'id': '1',
      'name': 'Happy Ekoumdoum',
      'distance': '0.8 km',
      'address': 'Carrefour Amitie, Yaounde',
      'rating': 4.8,
      'open': true,
      'image': 'assets/images/ads5.jpg',
    },
    {
      'id': '2',
      'name': 'Pharmacie Chapelle Obili',
      'distance': '1.2 km',
      'address': 'Byem-Assi, Yaounde',
      'rating': 4.5,
      'open': false,
      'image': 'assets/images/ads1.jpeg',
    },
    {
      'id': '3',
      'name': 'Pharmacie Soleil',
      'distance': '1.5 km',
      'address': 'Marche Centrale, Yaounde',
      'rating': 4.9,
      'open': true,
      'image': 'assets/images/ads3.jpg',
    },
    {
      'id': '4',
      'name': 'Pharmacie Odza',
      'distance': '1.5 km',
      'address': 'Odza, Yaounde',
      'rating': 4.9,
      'open': false,
      'image': 'assets/images/ads4.jpeg',
    },
    {
      'id': '5',
      'name': 'Pharmacie Nouvelle Route Omnisport',
      'distance': '1.5 km',
      'address': 'Omnisport, Yaounde',
      'rating': 4.9,
      'open': true,
      'image': 'assets/images/ads2.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green[700],
        title: Text('Pharmacies', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white,),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.white,),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Filtres rapides
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

          // Liste des pharmacies
          Expanded(
            child: ListView.builder(
              itemCount: pharmacies.length,
              itemBuilder: (context, index) {
                final pharmacy = pharmacies[index];
                return _buildPharmacyCard(context, pharmacy);
              },
            ),
          ),
        ],
      ),
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
              builder: (context) => PharmacyMedicamentsScreen(pharmacyId: pharmacy['id']),
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
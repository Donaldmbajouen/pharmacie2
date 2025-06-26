import 'package:flutter/material.dart';

class PharmacyMedicamentsScreen extends StatefulWidget {
  final String pharmacyId;
  final String pharmacyName;
  final List<Map<String, dynamic>> pharmacyMedicaments;

  const PharmacyMedicamentsScreen({
    Key? key,
    required this.pharmacyId,
    required this.pharmacyName,
    required this.pharmacyMedicaments
  }) : super(key: key);

  @override
  _PharmacyMedicamentsScreenState createState() => _PharmacyMedicamentsScreenState();
}

class _PharmacyMedicamentsScreenState extends State<PharmacyMedicamentsScreen> {
  late Map<String, dynamic> pharmacy;
  List<Map<String, dynamic>> medicaments = [];
  List<Map<String, dynamic>> filteredMedicaments = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadPharmacyData();
    searchController.addListener(_filterMedicaments);
  }

  void _loadPharmacyData() {
    // Utilisation des données passées en paramètre
    medicaments = List.from(widget.pharmacyMedicaments);
    filteredMedicaments = List.from(medicaments);

    // Données de base pour la pharmacie
    pharmacy = {
      'id': widget.pharmacyId,
      'name': widget.pharmacyName,
      'address': 'Adresse non spécifiée',
      'phone': '+237 6789878564',
      'open': true,
      'rating': 4.5,
      'distance': 'Distance non spécifiée',
      'image': 'assets/images/ads2.jpg',
      'description': 'Pharmacie',
    };
  }

  void _filterMedicaments() {
    final query = searchController.text.toLowerCase();

    setState(() {
      if (query.isEmpty) {
        filteredMedicaments = List.from(medicaments);
      } else {
        filteredMedicaments = medicaments.where((med) {
          return med['name'].toString().toLowerCase().contains(query) ||
              med['category'].toString().toLowerCase().contains(query);
        }).toList();
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text(
          pharmacy['name'],
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
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

          // Barre de recherche
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Rechercher un médicament ou catégorie...',
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
            child: filteredMedicaments.isEmpty
                ? Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Aucun médicament trouvé',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
            )
                : ListView.builder(
              itemCount: filteredMedicaments.length,
              itemBuilder: (context, index) {
                return _buildMedicamentCard(filteredMedicaments[index]);
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
                    backgroundColor: Colors.green[700],
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
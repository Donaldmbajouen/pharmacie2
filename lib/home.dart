import 'package:flutter/material.dart';
import 'package:flutter_projets/screens/notification_screen.dart';
import 'package:flutter_projets/screens/pharmacy_medicaments_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> pharmacies = [
    {
      'id': '1',
      'name': 'Happy Ekoumdoum',
      'distance': '0.8 km',
      'address': 'Carrefour Amitie, Yaounde',
      'rating': 4.8,
      'open': true,
      'image': 'assets/images/ads5.jpg',
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
      'medicaments': [
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
      'id': '4',
      'name': 'Pharmacie Odza',
      'distance': '1.5 km',
      'address': 'Odza, Yaounde',
      'rating': 4.9,
      'open': false,
      'image': 'assets/images/ads4.jpeg',
      'medicaments': [
        {
          'id': 'med6',
          'name': 'Ibuprofène',
          'description': 'Boîte de 12 comprimés',
          'price': 4.20,
          'image': 'assets/products/Robitussin.png',
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
      'medicaments': [
        {
          'id': 'med7',
          'name': 'Aspirine',
          'description': 'Boîte de 30 comprimés',
          'price': 2.80,
          'image': 'assets/products/Lipitor.png',
          'category': 'Douleur',
        },
      ],
    },
  ];

  TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _searchResults = [];
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_performSearch);
  }

  void _performSearch() {
    final query = _searchController.text.toLowerCase().trim();

    setState(() {
      _isSearching = query.isNotEmpty;

      if (_isSearching) {
        _searchResults = pharmacies.where((pharmacy) {
          // Correction du problème de typage ici
          final medicaments = pharmacy['medicaments'] as List<dynamic>;
          return medicaments.any((med) {
            final medMap = med as Map<String, dynamic>;
            return medMap['name'].toString().toLowerCase().contains(query);
          });
        }).toList();
      } else {
        _searchResults.clear();
      }
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('HomePharma', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
        backgroundColor: Colors.green[700],
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationScreen()
                  )
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section de recherche
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Rechercher un médicament...',
                    prefixIcon: Icon(Icons.search, color: Colors.green[700]),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.close, color: Colors.grey),
                      onPressed: () {
                        _searchController.clear();
                        setState(() {
                          _isSearching = false;
                          _searchResults.clear();
                        });
                      },
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
            ),

            // Résultats de recherche
            if (_isSearching) ...[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _searchResults.isEmpty
                      ? 'Aucun résultat trouvé'
                      : 'Pharmacies avec le médicament recherché',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 210,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 16),
                  children: _searchResults.map((pharmacy) =>
                      _buildPharmacyCard(
                        pharmacy['name'],
                        pharmacy['distance'],
                        pharmacy['image'],
                        pharmacy['open'],
                        pharmacy,
                      )
                  ).toList(),
                ),
              ),
            ],

            // Contenu normal (quand pas de recherche)
            if (!_isSearching) ...[
              // Section carte interactive
              Container(
                height: 200,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/ads1.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: FloatingActionButton(
                        mini: true,
                        backgroundColor: Colors.white,
                        onPressed: () {},
                        child: Icon(Icons.my_location, color: Colors.blue[700]),
                      ),
                    ),
                  ],
                ),
              ),

              // Section pharmacies à proximité
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Pharmacies à proximité',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Liste des pharmacies
              Container(
                height: 210,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 16),
                  children: pharmacies.take(3).map((pharmacy) =>
                      _buildPharmacyCard(
                        pharmacy['name'],
                        pharmacy['distance'],
                        pharmacy['image'],
                        pharmacy['open'],
                        pharmacy,
                      )
                  ).toList(),
                ),
              ),

              // Catégories de médicaments
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Catégories populaires',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Grille de catégories
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                children: [
                  _buildCategoryItem('Douleur', Icons.sick),
                  _buildCategoryItem('Douleur', Icons.sick),
                  _buildCategoryItem('Vitamines', Icons.emoji_food_beverage),
                  _buildCategoryItem('Soins', Icons.healing),
                  _buildCategoryItem('Bébé', Icons.child_friendly),
                  _buildCategoryItem('Allergie', Icons.air),
                  _buildCategoryItem('Digestion', Icons.fastfood),
                  _buildCategoryItem('Peau', Icons.face),
                ],
              ),

              // Section médicaments en promotion
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Promotions du moment',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('Voir tout', style: TextStyle(color: Colors.green[700])),
                    ),
                  ],
                ),
              ),

              // Liste des promotions
              Container(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 16),
                  children: [
                    _buildPromotionItem(
                      'Amoxil 1000mg',
                      'Boîte de 16 comprimés',
                      '5325 fcfa',
                      '4050 fcfa',
                      'assets/products/Amoxil.png',
                    ),
                    _buildPromotionItem(
                      'Benadryl',
                      '30 comprimés effervescents',
                      '5325 fcfa',
                      '4050 fcfa',
                      'assets/products/Benadryl.png',
                    ),
                    _buildPromotionItem(
                      'Centrum',
                      'Crème 100g',
                      '5325 fcfa',
                      '4050 fcfa',
                      'assets/products/Centrum.png',
                    ),
                    _buildPromotionItem(
                      'Cortizone',
                      'Crème 100g',
                      '5325 fcfa',
                      '4050 fcfa',
                      'assets/products/Cortizone.png',
                    ),
                    _buildPromotionItem(
                      'Excedrin',
                      'Crème 100g',
                      '5325 fcfa',
                      '4050 fcfa',
                      'assets/products/Excedrin.png',
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPharmacyCard(String name, String distance, String imageUrl, bool isOpen, Map<String, dynamic> pharmacy) {
    return GestureDetector(
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
      child: Container(
        width: 200,
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                imageUrl,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 80,
                  color: Colors.grey[200],
                  child: Icon(Icons.local_pharmacy, size: 40, color: Colors.blue[200]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 14, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(distance, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: isOpen ? Colors.green[50] : Colors.red[50],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          isOpen ? 'Ouvert' : 'Fermé',
                          style: TextStyle(
                            color: isOpen ? Colors.green : Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.star, color: Colors.amber, size: 18),
                      SizedBox(width: 2),
                      Text('4.8', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String name, IconData icon) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.green[50],
            radius: 28,
            child: Icon(icon, color: Colors.green[700], size: 30),
          ),
          SizedBox(height: 8),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildPromotionItem(String name, String description, String originalPrice, String discountPrice, String imageUrl) {
    return Container(
      width: 180,
      height: 150,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                child: Container(
                  height: 85,
                  color: Colors.grey[50],
                  child: Center(
                    child: Image.asset(
                      imageUrl,
                      height: 80,
                      errorBuilder: (context, error, stackTrace) => Icon(Icons.medication, size: 40, color: Colors.blue[200]),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red[600],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'PROMO',
                    style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  description,
                  style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      discountPrice,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[700],
                      ),
                    ),
                    SizedBox(width: 6),
                    Text(
                      originalPrice,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
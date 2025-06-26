import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pharma Favoris',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // appBarTheme: const AppBarTheme(
        //   backgroundColor: Colors.white,
        //   foregroundColor: Colors.black,
        //   elevation: 1,
        // ),
      ),
      home: FavoritesScreen(),
    );
  }
}

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Pharmacy> _favoritePharmacies = [
    Pharmacy(
      id: '1',
      name: 'Pharmacie Happy Ekoumdoum',
      address: 'Awaie, Yaoude',
      distance: 0.8,
      isOpen: true,
      rating: 4.7,
      phone: '6 23 45 67 89',
        imageurl: "assets/images/ads1.jpeg"
    ),
    Pharmacy(
      id: '2',
      name: 'Pharmacie du Soleil',
      address: 'Marche central, Yaounde',
      distance: 1.5,
      isOpen: false,
      rating: 4.3,
      phone: '6 87 65 43 21',
        imageurl: "assets/images/ads2.jpg"
    ),
    Pharmacy(
      id: '3',
      name: 'Pharmacie Chapelle Obili',
      address: 'BiyemAssi, Yaounde',
      distance: 2.3,
      isOpen: true,
      rating: 4.9,
      phone: '6 98 76 54 32',
        imageurl: "assets/images/ads3.jpg"
    ),
  ];

  final List<Medication> _favoriteMedications = [
    Medication(
        id: '101',
        name: 'Doliprane 1000mg',
        form: 'Comprimés',
        quantity: 'Boîte de 16',
        price: 3.20,
        stock: true,
        imageurl: "assets/products/Amoxil.png"
    ),
    Medication(
        id: '102',
        name: 'Smecta',
        form: 'Sachets',
        quantity: '12 sachets',
        price: 5.90,
        stock: true,
        imageurl: "assets/products/Amoxil.png"
    ),
    Medication(
      id: '103',
      name: 'Voltarene Emulgel',
      form: 'Gel',
      quantity: 'Tube de 100g',
      price: 8.50,
      stock: false,
      imageurl: "assets/products/Amoxil.png"
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Mes Favoris'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: _searchFavorites,
            tooltip: 'Rechercher',
          ),
        ],
        bottom: TabBar(
            controller: _tabController,
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Theme.of(context).primaryColor,
            tabs: const [
              Tab(icon: Icon(Icons.local_pharmacy)),
              Tab(icon: Icon(Icons.medication)),
            ],
      ),
    ),
    body: TabBarView(
      controller: _tabController,
      children: [
        _buildPharmaciesTab(),
        _buildMedicationsTab(),
      ],
    ),
    floatingActionButton: _tabController.index == 1
    ? FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: _addNewMedication,
      // backgroundColor: Theme.of(context).primaryColor,
    )
        : null,
    );
  }

  Widget _buildPharmaciesTab() {
    return _favoritePharmacies.isEmpty
        ? _buildEmptyPharmacies()
        : ListView.separated(
      padding: EdgeInsets.all(16),
      itemCount: _favoritePharmacies.length,
      separatorBuilder: (context, index) => SizedBox(height: 16),
      itemBuilder: (context, index) {
        final pharmacy = _favoritePharmacies[index];
        return _buildPharmacyCard(pharmacy, index);
      },
    );
  }

  Widget _buildPharmacyCard(Pharmacy pharmacy, int index) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
      Stack(
      children: [
      Container(
      height: 120,
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        ),
        child: Image(image: AssetImage(pharmacy.imageurl), width: 500,),
      ),
        Positioned(
          top: 10,
          right: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: pharmacy.isOpen ? Colors.green : Colors.red,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              pharmacy.isOpen ? 'OUVERT' : 'FERMÉ',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        ],
      ),
      Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    pharmacy.name,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    SizedBox(width: 4),
                    Text(pharmacy.rating.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.location_on, size: 18, color: Colors.grey),
                SizedBox(width: 4),
                Expanded(
                  child: Text(
                    pharmacy.address,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.directions_walk, size: 18, color: Colors.grey),
                SizedBox(width: 4),
                Text(
                  '${pharmacy.distance} km',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                Spacer(),
                Text(
                  pharmacy.phone,
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    icon: Icon(Icons.directions, size: 20),
                    label: Text('Itinéraire'),
                    onPressed: () => _navigateToPharmacy(pharmacy),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.call, size: 20),
                    label: Text('Appeler'),
                    onPressed: () => _callPharmacy(pharmacy),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.favorite, color: Colors.red),
                  onPressed: () => _removePharmacy(index),
                  tooltip: 'Retirer des favoris',
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

  Widget _buildMedicationsTab() {
    return _favoriteMedications.isEmpty
        ? _buildEmptyMedications()
        : GridView.builder(
      padding: EdgeInsets.all(5),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 5,
        mainAxisSpacing: 10,
      ),
      itemCount: _favoriteMedications.length,
      itemBuilder: (context, index) {
        final medication = _favoriteMedications[index];
        return _buildMedicationCard(medication, index);
      },
    );
  }

  Widget _buildMedicationCard(Medication medication, int index) {
    return Card(
      // elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 108,
            // width: 300,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            alignment: Alignment.center,
            child: Image.asset(
              medication.imageurl, // Remplacez par votre image
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  medication.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  medication.form,
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
                Text(
                  medication.quantity,
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${medication.price.toStringAsFixed(2)}k fcfa',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[700],
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Retirer des favoris"),
                    IconButton(
                      icon: Icon(Icons.favorite, color: Colors.red),
                      onPressed: () => _removeMedication(index),
                      tooltip: 'Retirer des favoris',
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

  Widget _buildEmptyPharmacies() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.local_pharmacy, size: 80, color: Colors.grey[300]),
          SizedBox(height: 20),
          Text(
            'Aucune pharmacie favorite',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          SizedBox(height: 10),
          Text(
            'Ajoutez des pharmacies à vos favoris\npour les retrouver facilement',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            icon: Icon(Icons.add_location),
            label: Text('Trouver des pharmacies'),
            onPressed: _findNearbyPharmacies,
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyMedications() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.medication, size: 80, color: Colors.grey[300]),
          SizedBox(height: 20),
          Text(
            'Aucun médicament favori',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          SizedBox(height: 10),
          Text(
            'Ajoutez vos médicaments fréquents\npour y accéder rapidement',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            icon: Icon(Icons.add),
            label: Text('Ajouter un médicament'),
            onPressed: _addNewMedication,
          ),
        ],
      ),
    );
  }

  // Fonctions d'actions
  void _navigateToPharmacy(Pharmacy pharmacy) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Itinéraire vers ${pharmacy.name}'),
        content: Text('Ouvrir dans Google Maps ou Apple Maps?'),
        actions: [
          TextButton(
            child: Text('ANNULER'),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text('OUVRIR'),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Ouverture de la carte...')),
              );
            },
          ),
        ],
      ),
    );
  }

  void _callPharmacy(Pharmacy pharmacy) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Appeler ${pharmacy.name}'),
        content: Text(pharmacy.phone),
        actions: [
          TextButton(
            child: Text('ANNULER'),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text('APPELER'),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Appel en cours...')),
              );
            },
          ),
        ],
      ),
    );
  }

  void _removePharmacy(int index) {
    setState(() {
      final removed = _favoritePharmacies.removeAt(index);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${removed.name} retirée des favoris'),
          action: SnackBarAction(
            label: 'ANNULER',
            onPressed: () {
              setState(() => _favoritePharmacies.insert(index, removed));
            },
          ),
        ),
      );
    });
  }

  void _removeMedication(int index) {
    setState(() {
      final removed = _favoriteMedications.removeAt(index);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${removed.name} retiré des favoris'),
          action: SnackBarAction(
            label: 'ANNULER',
            onPressed: () {
              setState(() => _favoriteMedications.insert(index, removed));
            },
          ),
        ),
      );
    });
  }

  void _addNewMedication() {
    // Implémentation de la logique d'ajout
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Ajouter un médicament',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Nom du médicament',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('Rechercher'),
              onPressed: () {
                Navigator.pop(context);
                // Logique de recherche et ajout
              },
            ),
          ],
        ),
      ),
    );
  }

  void _orderMedication(Medication medication) {
    // Logique de commande
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Commande de ${medication.name} en cours...')),
    );
  }

  void _searchFavorites() {
    // Logique de recherche
    showSearch(
      context: context,
      delegate: FavoritesSearchDelegate(
        pharmacies: _favoritePharmacies,
        medications: _favoriteMedications,
      ),
    );
  }

  void _findNearbyPharmacies() {
    // Logique de recherche de pharmacies
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Recherche des pharmacies à proximité...')),
    );
  }
}

// Modèles de données
class Pharmacy {
  final String id;
  final String name;
  final String address;
  final double distance;
  final bool isOpen;
  final double rating;
  final String phone;
  final String imageurl;

  Pharmacy({
    required this.id,
    required this.name,
    required this.address,
    required this.distance,
    required this.isOpen,
    required this.rating,
    required this.phone,
    required this.imageurl,
  });
}

class Medication {
  final String id;
  final String name;
  final String form;
  final String quantity;
  final double price;
  final bool stock;
  final String imageurl;

  Medication({
    required this.id,
    required this.name,
    required this.form,
    required this.quantity,
    required this.price,
    required this.stock,
    required this.imageurl,
  });
}

// Delegate pour la recherche (implémentation simplifiée)
class FavoritesSearchDelegate extends SearchDelegate {
  final List<Pharmacy> pharmacies;
  final List<Medication> medications;

  FavoritesSearchDelegate({required this.pharmacies, required this.medications});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults();
  }

  Widget _buildSearchResults() {
    final pharmaResults = pharmacies
        .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    final medResults = medications
        .where((m) => m.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView(
      children: [
        if (pharmaResults.isNotEmpty) ...[
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Pharmacies',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          ...pharmaResults.map((p) => ListTile(
            leading: Icon(Icons.local_pharmacy),
            title: Text(p.name),
            subtitle: Text(p.address),
            // onTap: () => close(context, p),
          )),
        ],
        if (medResults.isNotEmpty) ...[
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Médicaments',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          ...medResults.map((m) => ListTile(
            leading: Icon(Icons.medication),
            title: Text(m.name),
            subtitle: Text(m.form),
            // onTap: () => close(context, m),
          )),
        ],
        if (pharmaResults.isEmpty && medResults.isEmpty)
          Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Aucun résultat pour "$query"',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
      ],
    );
  }
}
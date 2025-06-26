import 'package:flutter/material.dart';
import 'package:flutter_projets/user_repository.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Map<String, dynamic> userData;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() {
    final user = UserRepository.currentUser;
    if (user != null) {
      setState(() {
        userData = Map<String, dynamic>.from(user);
        _nameController.text = userData['username'] ?? '';
        _emailController.text = userData['email'] ?? '';
        _phoneController.text = userData['phone'] ?? '';
        _addressController.text = userData['address'] ?? '';
        _birthdateController.text = userData['birthdate'] ?? '';
      });
    } else {
      setState(() {
        userData = {
          'username': 'Jean Donald',
          'email': 'jean.donald@example.com',
          'phone': '+237 6 12 34 56 78',
          'address': 'Yaounde, Awaie',
          'birthdate': '01/01/1980',
          'createdAt': DateTime.now(),
        };
      });
    }
  }

  void _saveUserData(String field, String value) {
    UserRepository.updateUser(field, value);
    setState(() {
      userData[field] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.green[700],
            expandedHeight: 220.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Mon Profil', style: TextStyle(color: Colors.white)),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/avatars/avatar3.jpg',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black,
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 4,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/avatars/avatar2.jpg',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Icon(Icons.person, size: 50, color: Colors.blue),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green[700],
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.edit, color: Colors.white, size: 18),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    userData['username'] ?? 'Jean Donald',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Membre depuis Mars 2025', // Cette date pourrait être dynamisée
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),

                  SizedBox(height: 24),
                  _buildPersonalInfoSection(),
                  SizedBox(height: 24),
                  _buildPreferencesSection(),
                  SizedBox(height: 24),
                  _buildActionButtons(),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalInfoSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Informations Personnelles',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          _buildInfoItem(Icons.person, 'Nom', _nameController.text.isNotEmpty ? _nameController.text : 'Jean Donald'),
          _buildInfoItem(Icons.email, 'Email', _emailController.text.isNotEmpty ? _emailController.text : 'jean.donald@example.com'),
          _buildInfoItem(Icons.phone, 'Téléphone', _phoneController.text.isNotEmpty ? _phoneController.text : '+237 6 00 00 00 00'),
          _buildInfoItem(Icons.location_on, 'Adresse', _addressController.text.isNotEmpty ? _addressController.text : 'Yaounde, Awaie'),
          _buildInfoItem(Icons.calendar_today, 'Date de naissance', _birthdateController.text.isNotEmpty ? _birthdateController.text : '01/01/1980'),
        ],
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.green[700],
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.edit, size: 18, color: Colors.green[700]),
            onPressed: () => _showEditDialog(context, label, _getControllerForField(label)),
          ),
        ],
      ),
    );
  }

  TextEditingController _getControllerForField(String label) {
    switch (label) {
      case 'Nom': return _nameController;
      case 'Email': return _emailController;
      case 'Téléphone': return _phoneController;
      case 'Adresse': return _addressController;
      case 'Date de naissance': return _birthdateController;
      default: return _nameController;
    }
  }

  String _getFieldName(String label) {
    switch (label) {
      case 'Nom': return 'username';
      case 'Email': return 'email';
      case 'Téléphone': return 'phone';
      case 'Adresse': return 'address';
      case 'Date de naissance': return 'birthdate';
      default: return 'username';
    }
  }

  void _showEditDialog(BuildContext context, String title, TextEditingController controller) {
    final field = _getFieldName(title);
    showDialog(
      context: context,
      builder: (context) {
        final tempController = TextEditingController(text: controller.text);

        return AlertDialog(
          title: Text('Modifier $title'),
          content: TextField(
            controller: tempController,
            decoration: InputDecoration(
              hintText: 'Entrez votre $title',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () {
                final newValue = tempController.text;
                controller.text = newValue;
                _saveUserData(field, newValue);
                Navigator.pop(context);
                setState(() {}); // Rafraîchir l'interface
              },
              child: Text('Enregistrer'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPreferencesSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Préférences',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.notifications, color: Colors.green[700]),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  'Notifications',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Switch(
                value: true,
                activeColor: Colors.green[700],
                onChanged: (value) {},
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.language, color: Colors.green[700]),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  'Langue',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Text(
                'Français',
                style: TextStyle(color: Colors.green[700]),
              ),
              Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.medical_services, color: Colors.green[700]),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  'Pharmacie préférée',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Text(
                'Pharmacie Centrale',
                style: TextStyle(color: Colors.grey[600]),
              ),
              Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            icon: Icon(Icons.logout, color: Colors.white),
            label: Text('Déconnexion', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              UserRepository.currentUserEmail = null;
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
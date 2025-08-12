import 'package:aplikasi/screens/mainScreen/event_detail_page.dart';
import 'package:aplikasi/screens/mainScreen/transaction_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color(
        0xFF1C1C1E,
      ), //Warna Background bisa diubah kalau jelek
      bottomNavigationBar: BottomNavigationBar(
  currentIndex: 1, // Home index
  backgroundColor: Colors.black,
  selectedItemColor: Colors.purple,
  unselectedItemColor: Colors.white,
  onTap: (index) {
    if (index == 0) {
      // Transaction
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const TransactionPage()),
      );
    } else if (index == 2) {
      // Profile (kalau nanti ada)
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ProfilePage()));
    }
  },
  items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.confirmation_num),
      label: 'Transaction',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ],
),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              //Header
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Welcome, Caesar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Discover the hottest clubs and events.',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage(
                      'assets/Profile.jpg',
                    ), //Jangan lupa PP dimasukin
                  ),
                ],
              ),
              const SizedBox(height: 20),

              //Search Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    icon: Icon(Icons.search, color: Colors.grey),
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 34),

              //Promo
              const Text(
                'Promo',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 140,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    return _buildCard();
                  },
                ),
              ),
              const SizedBox(height: 24),

              //Event
              const Text(
                'Event',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Column(
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _buildFullCard(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        'assets/sample.jpg', //Gambar untuk placeholder
        width: 220,
        height: 140,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildFullCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => EventDetailPage(
              title: 'Event Contoh 1',
              date: '17 Agustus 2025',
              artist: 'Justin Beiber',
              time: '20.00',
              imagePath: 'assets/sample.jpg',
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          'assets/sample.jpg',
          width: MediaQuery.of(context).size.width,
          height: 180,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

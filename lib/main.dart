import 'package:flutter/material.dart';

void main() {
  runApp(SportsApp());
}

class SportsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sports App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'Bola Kaki';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome Back!',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer),
            label: 'Sports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Banner
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://images.pexels.com/photos/2280541/pexels-photo-2280541.jpeg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 16,
                      left: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mulai berolahraga\ndan mencari teman bersama',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Lihat sekarang'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Categories
              Text(
                'Kategori Olahraga',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCategoryButton('Bola Kaki'),
                  _buildCategoryButton('Basket'),
                  _buildCategoryButton('Renang'),
                  _buildCategoryButton('Futsal'),
                ],
              ),
              SizedBox(height: 16),
              // Booking Cards
              Text(
                'Booking Terfavorit',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              _buildBookingCard(
                  context,
                  'Yuk Sehat Bersama!',
                  'https://images.pexels.com/photos/2294401/pexels-photo-2294401.jpeg',
                  'Lapangan Trior, Jakarta Barat',
                  30),
              _buildBookingCard(
                  context,
                  'Alumni Unsri Kumpul Yuk!',
                  'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg',
                  'Lapangan Kebon Jeruk',
                  25),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String category) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selectedCategory == category ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          category,
          style: TextStyle(
            color: selectedCategory == category ? Colors.white : Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildBookingCard(BuildContext context, String title, String imageUrl,
      String location, int price) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage(title: title)),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(location, style: TextStyle(fontSize: 14)),
                  SizedBox(height: 8),
                  Text('Rp $price.000 / Orang',
                      style:
                          TextStyle(fontSize: 14, color: Colors.greenAccent)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;

  DetailPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          'Detail Screen for $title',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

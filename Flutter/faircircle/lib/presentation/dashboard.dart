import 'package:flutter/material.dart';
import 'package:faircircle/data/datasource/product_datasource.dart';
import 'package:faircircle/data/repositories/product_repository_impl.dart';
import 'package:faircircle/domain/entities/product_entity.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  Future<List<ProductEntity>> _fetchProducts() async {
    final remoteDataSource = ProductRemoteDataSource(
      apiUrl: 'https://yourapi.com/products',
    ); // <-- Replace with your real API
    final repo = ProductRepositoryImpl(
      localDataSource: null, // Not used here
      remoteDataSource: remoteDataSource,
    );
    return await repo.fetchProductsFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F3EC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF8B4A2F), Color(0xFFE2A478)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome back,",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "FAir Circle",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            const Icon(Icons.search, color: Colors.grey),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Search here",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            const Icon(Icons.filter_list, color: Colors.grey),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Offer banner
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF8B4A2F),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "90% OFF",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "First Purchase Discount",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Enjoy a special discount as a token of appreciation for choosing us.",
                        style: TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Color(0xFF8B4A2F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text("Shop Now"),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Categories
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _categoryChip("All"),
                    _categoryChip("Face"),
                    _categoryChip("Hair"),
                    _categoryChip("Body"),
                    _categoryChip("Skin"),
                    _categoryChip("Nail"),
                  ],
                ),

                const SizedBox(height: 20),

                // Products Grid (dynamic)
                FutureBuilder<List<ProductEntity>>(
                  future: _fetchProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: \\${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No products found'));
                    }
                    final products = snapshot.data!;
                    return GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.7,
                      children:
                          products
                              .map(
                                (product) => _productCard(
                                  product.title,
                                  product.imagePath,
                                ),
                              )
                              .toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),

      // Bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF8B4A2F),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Dashboard"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Wishlist",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Account",
          ),
        ],
      ),
    );
  }

  Widget _categoryChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Color(0xFFEEDACB),
      labelStyle: TextStyle(color: Color(0xFF8B4A2F)),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    );
  }

  Widget _productCard(String title, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              imagePath,
              fit: BoxFit.contain,
              errorBuilder:
                  (context, error, stackTrace) => Icon(Icons.broken_image),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const Text(" 29.99", style: TextStyle(color: Colors.black54)),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.amber, size: 16),
              SizedBox(width: 4),
              Text("4.9", style: TextStyle(color: Colors.black54)),
            ],
          ),
        ],
      ),
    );
  }
}

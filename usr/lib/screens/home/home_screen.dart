import 'package:flutter/material.dart';
import 'package:couldai_user_app/core/theme.dart';
import 'package:couldai_user_app/widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildSidebar(context),
      appBar: AppBar(
        title: const Text('Marketplace Angola'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // 1. Hero Carousel (Slides)
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: PageView(
                children: [
                  _buildBanner(Colors.blue, 'Ofertas de Verão'),
                  _buildBanner(Colors.orange, 'Novos Eletrônicos'),
                  _buildBanner(Colors.red, 'Moda Angolana'),
                ],
              ),
            ),
          ),

          // 2. Categories / Highlights
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildCategoryItem(Icons.phone_iphone, 'Phones', Colors.blue),
                  _buildCategoryItem(Icons.checkroom, 'Moda', Colors.pink),
                  _buildCategoryItem(Icons.laptop, 'Tech', Colors.purple),
                  _buildCategoryItem(Icons.fastfood, 'Food', Colors.orange),
                  _buildCategoryItem(Icons.sports_soccer, 'Sport', Colors.green),
                ],
              ),
            ),
          ),

          // 3. Section Title
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Destaques da Semana',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // 4. 3x3 Product Matrix
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 3x3 Matrix as requested
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.65, // Taller cards to fit info
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ProductCard(
                    title: 'Produto ${index + 1}',
                    price: '${(index + 1) * 2000} Kz',
                    storeName: 'Loja Top ${index}',
                    imageUrl: '',
                  );
                },
                childCount: 9,
              ),
            ),
          ),

          // 5. Sponsored / Zap Cinema Ads
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 24),
              height: 150,
              color: Colors.black,
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.movie, color: Colors.white, size: 40),
                          SizedBox(height: 8),
                          Text(
                            'ZAP CINEMA',
                            style: TextStyle(
                                color: AppTheme.vibrantYellow,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text('Estreias da Semana',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 6. Infinite Store Carousel
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Lojas Parceiras',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    width: 80,
                    margin: const EdgeInsets.only(left: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Center(child: Text('Loja $index')),
                  );
                },
              ),
            ),
          ),
          
          const SliverToBoxAdapter(child: SizedBox(height: 100)), // Bottom padding
        ],
      ),
    );
  }

  Widget _buildBanner(Color color, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(IconData icon, String label, Color color) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildSidebar(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Usuário Visitante'),
            accountEmail: const Text('usuario@email.com'),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: AppTheme.primaryBlue),
            ),
            decoration: const BoxDecoration(
              color: AppTheme.primaryBlue,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Início'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.store),
            title: const Text('Todas as Lojas'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text('Produtos'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Painel de Vendedor'),
            onTap: () {
              Navigator.pushNamed(context, '/seller_dashboard');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configurações'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

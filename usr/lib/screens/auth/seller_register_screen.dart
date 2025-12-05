import 'package:flutter/material.dart';
import 'package:couldai_user_app/core/theme.dart';

class SellerRegisterScreen extends StatelessWidget {
  const SellerRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Loja'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      shape: BoxShape.circle,
                      border: Border.all(color: AppTheme.primaryBlue, width: 2),
                    ),
                    child: const Icon(Icons.store, size: 40, color: Colors.grey),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: AppTheme.vibrantOrange,
                      radius: 16,
                      child: const Icon(Icons.camera_alt, size: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const TextField(
              decoration: InputDecoration(labelText: 'Nome da Loja'),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Tipo de Loja'),
              items: const [
                DropdownMenuItem(value: 'eletronicos', child: Text('Eletrônicos')),
                DropdownMenuItem(value: 'moda', child: Text('Moda')),
                DropdownMenuItem(value: 'alimentos', child: Text('Alimentos')),
              ],
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(labelText: 'Endereço Completo'),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(labelText: 'Email Comercial'),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(labelText: 'Contacto (WhatsApp)'),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.shade100),
              ),
              child: Column(
                children: [
                  const Icon(Icons.upload_file, color: AppTheme.primaryBlue, size: 32),
                  const SizedBox(height: 8),
                  const Text(
                    'Cópia do Bilhete (Opcional)',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Selecionar Arquivo'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Show success alert and navigate
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Conta Criada!'),
                    content: const Text(
                        'Sua loja foi criada. Após 5 vendas, você deverá adquirir um dos nossos pacotes (Básico, Padrão ou Premium).'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Close dialog
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/seller_dashboard', (route) => false);
                        },
                        child: const Text('Entendi'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Criar Minha Loja'),
            ),
          ],
        ),
      ),
    );
  }
}

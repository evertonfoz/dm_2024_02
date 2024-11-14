// import 'package:flutter/material.dart';

// import '../data/customers_supabase_datasource.dart';

// class DashboardPage extends StatelessWidget {
//   const DashboardPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Dashboard'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: FutureBuilder(
//             future: CustomerSupabaseDatasource().getAllCustomers(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//               if (snapshot.hasError) {
//                 return Center(
//                   child: Text('Erro ao buscar clientes: ${snapshot.error}'),
//                 );
//               }
//               if (snapshot.data == null || snapshot.data!.isEmpty) {
//                 return const Center(
//                   child: Text('Nenhum cliente encontrado'),
//                 );
//               }

//               final customers = snapshot.data!;
//               return ListView.builder(
//                 itemCount: customers.length,
//                 itemBuilder: (context, index) {
//                   final customer = customers[index];
//                   return ListTile(
//                     title: Text(customer.name),
//                     subtitle: Text(customer.email),
//                   );
//                 },
//               );
//             }),
//       ),
//     );
//   }
// }

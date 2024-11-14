import 'package:login_and_dashboard/features/dashboard/domain/customer_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CustomerSupabaseDatasource {
  Future<List<CustomerEntity>> getAllCustomers(
      {int limit = 10, int offset = 0}) async {
    List<CustomerEntity> customers = [];

    final response = await Supabase.instance.client
        .from('clientes')
        .select('nome, email')
        .range(offset, (offset + limit - 1));
    // if (response.isEmpty) {
    //   throw Exception('Erro ao buscar clientes');
    // }
    if (response.isNotEmpty) {
      customers =
          response.map((customer) => CustomerEntity.fromMap(customer)).toList();
    }
    return customers;
  }
}

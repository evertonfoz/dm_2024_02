import 'package:flutter/material.dart';

import '../data/customers_supabase_datasource.dart';
import '../domain/customer_entity.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<CustomerEntity> _customers = [];
  final _scrollController = ScrollController();
  bool _isLoading = false;
  bool _hasMoreData = true;
  final int _limit = 20;
  int _offset = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchData();
      _scrollController.addListener(_onScroll);
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  Future _fetchData() async {
    if (_isLoading || !_hasMoreData) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final customers = await CustomerSupabaseDatasource().getAllCustomers(
      limit: _limit,
      offset: _offset,
    );

    if (customers.isEmpty) {
      setState(() {
        _hasMoreData = false;
      });
    } else {
      setState(() {
        _customers.addAll(customers);
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _offset += _limit;
      _fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _customers.isEmpty && _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : _customers.isEmpty
                ? const Center(
                    child: Text('Nenhum cliente encontrado'),
                  )
                : ListView.builder(
                    controller: _scrollController,
                    itemCount: _customers.length + (_hasMoreData ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == _customers.length) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final customer = _customers[index];
                      return ListTile(
                        title: Text(customer.name),
                        subtitle: Text(customer.email),
                      );
                    },
                  ),
      ),
    );
  }
}

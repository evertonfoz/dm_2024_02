class CustomerEntity {
  final int? clientId;
  final String name;
  final String email;
  final String? phoneNumber;
  final String? address;
  final DateTime? registerDate;

  CustomerEntity({
    this.clientId,
    required this.name,
    required this.email,
    this.phoneNumber,
    this.address,
    this.registerDate,
  });

  factory CustomerEntity.fromMap(Map<String, dynamic> map) {
    return CustomerEntity(
      clientId: map['cliente_id'],
      name: map['nome'],
      email: map['email'],
      phoneNumber: map['telefone'],
      address: map['endereco'],
      registerDate: map['data_cadastro'] != null
          ? DateTime.parse(map['data_cadastro'])
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'client_id': clientId,
      'name': name,
      'email': email,
      'phone_number': phoneNumber,
      'address': address,
      'register_date': registerDate?.toIso8601String(),
    };
  }

  CustomerEntity copyWith({
    int? clientId,
    String? name,
    String? email,
    String? phoneNumber,
    String? address,
    DateTime? registerDate,
  }) {
    return CustomerEntity(
      clientId: clientId ?? this.clientId,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      registerDate: registerDate ?? this.registerDate,
    );
  }
}

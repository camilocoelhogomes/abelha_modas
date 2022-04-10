class Customer {
  String cpf;
  String name;
  String phoneNumber;
  String? email;
  Address address;
  Customer({
    required this.name,
    required this.phoneNumber,
    required this.cpf,
    required this.address,
    this.email,
  });
}

class Address {
  String cep;
  String state;
  String city;
  String neighborhood;
  String street;
  String number;
  String? complement;
  Address({
    required this.cep,
    required this.state,
    required this.city,
    required this.neighborhood,
    required this.street,
    required this.number,
    this.complement,
  });
}

class Category {
  String name;
  String description;
  int priceInCentsPerDay;
  Category({
    required this.name,
    required this.description,
    required this.priceInCentsPerDay,
  });
}

class ClothesType {
  String name;
  String size;
  String description;
  String sex;
  Category category;
  ClothesType({
    required this.name,
    required this.size,
    required this.description,
    required this.sex,
    required this.category,
  });
}

class UniquePiece {
  int id;
  ClothesType clothesType;
  UniquePiece({
    required this.id,
    required this.clothesType,
  });
}

class Rent {
  String rentId;
  bool isDelivered = false;
  DateTime rentDay;
  DateTime deliveryDay;
  List<UniquePiece> piecesRented;
  Customer customer;
  Rent({
    required this.rentId,
    required this.rentDay,
    required this.deliveryDay,
    required this.piecesRented,
    required this.customer,
  });
}

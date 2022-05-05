import 'package:abelha_modas/domain/entities.dart';
import 'package:abelha_modas/domain/erros.dart';

abstract class RegisterCustomer {
  Future<Customer> registerCustomer(Customer customer);
}

abstract class SearchCustomer {
  Future<List<Customer>> searchCustomer(String searchFor);
}

abstract class CreateCategory {
  Future<Category> createCategory(Category category);
}

abstract class CreateClothesType {
  Future<ClothesType> createClothesType(ClothesType clothesType);
}

abstract class CreateUniquePiece {
  Future<UniquePiece> createUniquePiece(UniquePiece uniquePiece);
}

abstract class CreateRent {
  Future<Rent> createRent(Rent rent);
}

class RegisterCustomerUseCase implements RegisterCustomer {
  final RegisterCustomer _creator;

  RegisterCustomerUseCase({required creator}) : _creator = creator;

  @override
  Future<Customer> registerCustomer(Customer customer) {
    return _creator.registerCustomer(customer);
  }
}

class SearchCustomerUseCase implements SearchCustomer {
  final SearchCustomer _creator;

  SearchCustomerUseCase({required creator}) : _creator = creator;

  @override
  Future<List<Customer>> searchCustomer(String searchFor) {
    RegExp cpfRegex = RegExp(r'\d{11}');
    try {
      return _creator.searchCustomer(searchFor);
    } catch (e) {
      rethrow;
    }
  }
}

class CreateCategoryUseCase implements CreateCategory {
  final CreateCategory _creator;
  CreateCategoryUseCase({required creator}) : _creator = creator;

  @override
  Future<Category> createCategory(Category category) {
    try {
      return _creator.createCategory(category);
    } catch (e) {
      rethrow;
    }
  }
}

class CreateClothesTypeUseCase implements CreateClothesType {
  final CreateClothesType _creator;
  CreateClothesTypeUseCase({required creator}) : _creator = creator;

  @override
  Future<ClothesType> createClothesType(ClothesType clothesType) {
    try {
      return _creator.createClothesType(clothesType);
    } catch (e) {
      rethrow;
    }
  }
}

class CreateUniquePieceUseCase implements CreateUniquePiece {
  final CreateUniquePiece _creator;
  CreateUniquePieceUseCase({required creator}) : _creator = creator;

  @override
  Future<UniquePiece> createUniquePiece(UniquePiece uniquePiece) {
    try {
      return _creator.createUniquePiece(uniquePiece);
    } catch (e) {
      rethrow;
    }
  }
}

class CreateRentUseCase implements CreateRent {
  final CreateRent _creator;
  CreateRentUseCase({required creator}) : _creator = creator;

  @override
  Future<Rent> createRent(Rent rent) {
    try {
      return _creator.createRent(rent);
    } catch (e) {
      rethrow;
    }
  }
}

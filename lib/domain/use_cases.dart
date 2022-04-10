import 'package:abelha_modas/domain/entities.dart';
import 'package:abelha_modas/domain/erros.dart';

abstract class RegisterCustomer {
  Future<Customer> registerCustomer(Customer customer);
}

abstract class SearchCustomer {
  Future<List<Customer>> searchCustomerBy(String searchBy, String searchFor);
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
  Future<List<Customer>> searchCustomerBy(String searchBy, String searchFor) {
    RegExp cpfRegex = RegExp(r'\d{11}');
    try {
      if (searchBy != 'cpf' && searchBy != 'name') {
        throw FieldNotSearchble(message: 'search by needs to be cpf or name');
      }
      if (searchBy == 'cpf' && !cpfRegex.hasMatch(searchFor)) {
        throw FieldNotSearchble(message: 'cpf don\'t match regex \'\\d{11}\'');
      }
      return _creator.searchCustomerBy(searchBy, searchFor);
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
    return _creator.createCategory(category);
  }
}

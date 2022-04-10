import 'package:abelha_modas/domain/entities.dart';
import 'package:abelha_modas/domain/erros.dart';
import 'package:abelha_modas/domain/use_cases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../faker/faker.dart';
import 'use_cases_test.mocks.dart';

@GenerateMocks([RegisterCustomer])
@GenerateMocks([Customer])
@GenerateMocks([SearchCustomer])
void main() {
  group('Test RegisterCustomerUseCase', () {
    test('Create with success', () async {
      final creator = MockRegisterCustomer();
      when(creator.registerCustomer(any)).thenAnswer((_) async => fakeCustomer);
      RegisterCustomerUseCase constructor =
          RegisterCustomerUseCase(creator: creator);
      final result = await constructor.registerCustomer(fakeCustomer);
      expect(result, isA<Customer>());
    });

    test('Get an error', () async {
      final creator = MockRegisterCustomer();
      when(creator.registerCustomer(any)).thenThrow(Exception);
      RegisterCustomerUseCase constructor =
          RegisterCustomerUseCase(creator: creator);
      expect(
          () => constructor.registerCustomer(fakeCustomer), throwsA(Exception));
    });
  });

  group('SearchCustomerUseCase', () {
    test('Search Whith Success by cpf', () async {
      final creator = MockSearchCustomer();
      SearchCustomerUseCase testing = SearchCustomerUseCase(creator: creator);
      when(creator.searchCustomerBy(any, any))
          .thenAnswer((_) async => fakeCustomer);
      final result = await testing.searchCustomerBy('cpf', '12345678900');
      expect(result, isA<Customer>());
    });
    test('Search Whith Success by name', () async {
      final creator = MockSearchCustomer();
      SearchCustomerUseCase testing = SearchCustomerUseCase(creator: creator);
      when(creator.searchCustomerBy(any, any))
          .thenAnswer((_) async => fakeCustomer);
      final result = await testing.searchCustomerBy('name', '12345678900');
      expect(result, isA<Customer>());
    });
    test('Throw field not searchble', () async {
      final creator = MockSearchCustomer();
      SearchCustomerUseCase testing = SearchCustomerUseCase(creator: creator);
      when(creator.searchCustomerBy(any, any))
          .thenAnswer((_) async => fakeCustomer);
      expect(() => testing.searchCustomerBy('searchBy', 'searchFor'),
          throwsA(isA<FieldNotSearchble>()));
    });
    test(
        'Throw field not searchble when field is a CPF and searchFor isn\'t a cpf',
        () async {
      final creator = MockSearchCustomer();
      SearchCustomerUseCase testing = SearchCustomerUseCase(creator: creator);
      when(creator.searchCustomerBy(any, any))
          .thenAnswer((_) async => fakeCustomer);
      expect(() => testing.searchCustomerBy('cpf', '1234567890'),
          throwsA(isA<FieldNotSearchble>()));
    });
  });
}

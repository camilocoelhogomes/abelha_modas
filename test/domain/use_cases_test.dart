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
@GenerateMocks([CreateCategory])
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

  group('SearchCustomerUseCase', () {});
  group('Create Category', () {
    test('Create the category', () async {
      final creator = MockCreateCategory();
      CreateCategoryUseCase testing = CreateCategoryUseCase(creator: creator);
      when(creator.createCategory(any)).thenAnswer((_) async => fakeCategory);
      Category result = await testing.createCategory(fakeCategory);
      expect(result, isA<Category>());
    });

    test('Rethrow the recived error', () async {
      final creator = MockCreateCategory();
      CreateCategoryUseCase testing = CreateCategoryUseCase(creator: creator);
      when(creator.createCategory(any)).thenThrow(Exception);
      expect(() => testing.createCategory(fakeCategory), throwsA(Exception));
    });
  });
}

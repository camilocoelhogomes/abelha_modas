import 'package:abelha_modas/domain/entities.dart' as entities;
import 'package:faker/faker.dart';

entities.Address fakeAddress = entities.Address(
  cep: faker.address.zipCode(),
  state: faker.address.state(),
  city: faker.address.city(),
  neighborhood: faker.address.neighborhood(),
  street: faker.address.streetName(),
  number: faker.address.streetAddress(),
);

entities.Customer fakeCustomer = entities.Customer(
    name: faker.person.firstName(),
    phoneNumber: faker.phoneNumber.us(),
    cpf: faker.randomGenerator.fromPattern([r'\d{11}']),
    address: fakeAddress);

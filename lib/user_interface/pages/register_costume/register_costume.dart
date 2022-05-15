import 'package:abelha_modas/domain/entities.dart';
import 'package:flutter/material.dart';

class RegisterCostumePage extends StatefulWidget {
  const RegisterCostumePage({super.key});

  @override
  State<RegisterCostumePage> createState() => _RegisterCostumePageState();
}

class _RegisterCostumePageState extends State<RegisterCostumePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Abelha modas',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Abelha Modas'),
        ),
        body: RegisterCategoryForm(),
      ),
    );
  }
}

class RegisterCategoryForm extends StatefulWidget {
  const RegisterCategoryForm({super.key});

  @override
  State<RegisterCategoryForm> createState() => _RegisterCategoryFormState();
}

class CategoryEditingController extends Category {
  final Category? oldCategory;
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceInCentsPerDayController = TextEditingController();

  CategoryEditingController(
      {super.name = '',
      super.description = '',
      super.priceInCentsPerDay = 0,
      this.oldCategory}) {
    if (oldCategory != null) {
      nameController.text = oldCategory!.name;
      descriptionController.text = oldCategory!.description;
      priceInCentsPerDayController.text =
          oldCategory!.priceInCentsPerDay.toString();
    }
  }

  Category get category {
    super.name = nameController.text;
    super.description = descriptionController.text;
    super.priceInCentsPerDay = int.parse(priceInCentsPerDayController.text);
    return this;
  }
}

class _RegisterCategoryFormState extends State<RegisterCategoryForm> {
  final _formKey = GlobalKey<FormState>();
  CategoryEditingController controllers = CategoryEditingController(
      oldCategory: Category(
    name: 'Camilo',
    description: 'description',
    priceInCentsPerDay: 0,
  ));
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: CustomFormField(
                      hintText: 'Papai Noel',
                      label: 'Nome da Categoria',
                      controller: controllers.nameController,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: CustomFormField(
                    hintText: 'R\$ 15,00',
                    label: 'Aluguel por dia',
                    controller: controllers.priceInCentsPerDayController,
                    keyboardType: const TextInputType.numberWithOptions(),
                  ),
                ),
              ],
            ),
            CustomFormField(
              controller: controllers.descriptionController,
              hintText: 'Descreva a Categoria',
              label: 'Descrição',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(controllers.name)),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {Key? key,
      required this.hintText,
      required this.label,
      this.validator,
      required this.controller,
      this.onChanged,
      this.keyboardType})
      : super(key: key);

  final String hintText;
  final String label;
  final String? Function(String? string)? validator;
  final TextEditingController controller;
  final void Function(String value)? onChanged;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        label: Text(label),
      ),
      validator: validator,
    );
  }
}

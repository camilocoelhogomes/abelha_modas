import 'package:abelha_modas/domain/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

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

class CategoryEditingController {
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController priceInCentsPerDay = TextEditingController();
}

class _RegisterCategoryFormState extends State<RegisterCategoryForm> {
  final _formKey = GlobalKey<FormState>();
  CategoryEditingController controllers = CategoryEditingController();
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
                      controller: controllers.name,
                      validator: (String? name) =>
                          name == null ? null : 'adicione um nome',
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: CustomFormField(
                    hintText: 'R\$ 15,00',
                    label: 'Aluguel por dia',
                    controller: controllers.priceInCentsPerDay,
                    validator: (String? name) =>
                        name == null ? null : 'adicione um nome',
                    keyboardType: const TextInputType.numberWithOptions(),
                  ),
                ),
              ],
            ),
            CustomFormField(
              controller: controllers.description,
              hintText: 'Descreva a Categoria',
              label: 'Descrição',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
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
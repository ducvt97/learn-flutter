import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/utils/validation.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  String? _editProductId;
  final _imgUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();
  final _product = Product(
    id: '',
    title: '',
    description: '',
    price: 0,
    imageUrl: '',
  );

  @override
  void dispose() {
    _imgUrlController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _editProductId = ModalRoute.of(context)?.settings.arguments as String?;
    if (_editProductId != null) {
      final initProduct = Provider.of<ProductsProvider>(
        context,
        listen: false,
      ).getById(_editProductId!);
      _imgUrlController.text = initProduct.imageUrl;
      _product.id = initProduct.id;
      _product.title = initProduct.title;
      _product.description = initProduct.title;
      _product.price = initProduct.price;
      _product.imageUrl = initProduct.imageUrl;
    } else {
      _product.id = DateTime.now().toString();
    }
    super.didChangeDependencies();
  }

  void onSaveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) return;
    _form.currentState!.save();
    if (_editProductId == null) {
      Provider.of<ProductsProvider>(context, listen: false)
          .addProduct(_product);
    } else {
      Provider.of<ProductsProvider>(context, listen: false)
          .updateProduct(_editProductId!, _product);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        actions: [
          IconButton(
            onPressed: onSaveForm,
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Form(
        key: _form,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            child: Column(
              children: [
                TextFormField(
                  initialValue: _product.title,
                  decoration: const InputDecoration(
                    labelText: 'Title *',
                  ),
                  textInputAction: TextInputAction.next,
                  onSaved: (value) => _product.title = value!,
                  validator: (value) => ValidationInput.checkEmpty(value),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  initialValue: _product.price.toStringAsFixed(2),
                  decoration: const InputDecoration(
                    labelText: 'Price *',
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _product.price = double.parse(value!),
                  validator: (value) {
                    if (ValidationInput.checkEmpty(value) != null) {
                      return ValidationInput.checkEmpty(value);
                    }
                    return ValidationInput.checkNumber(value!);
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  initialValue: _product.description,
                  decoration: const InputDecoration(
                    labelText: 'Description *',
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  onSaved: (value) => _product.description = value!,
                  validator: (value) => ValidationInput.checkEmpty(value),
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black87),
                      ),
                      child: _imgUrlController.text.isEmpty
                          ? const Text('Enter URL *')
                          : FittedBox(
                              fit: BoxFit.cover,
                              child: Image.network(
                                _imgUrlController.text,
                                errorBuilder: (context, error, _) {
                                  return Text(
                                    'Error',
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.error,
                                    ),
                                  );
                                },
                              ),
                            ),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Image URL',
                        ),
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        onEditingComplete: () => setState(() {}),
                        controller: _imgUrlController,
                        onSaved: (value) => _product.imageUrl = value!,
                        validator: (value) => ValidationInput.checkEmpty(value),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

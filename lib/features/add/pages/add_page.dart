import 'package:beer_ranking/app/core/enums.dart';
import 'package:beer_ranking/data/remote_data_source/beer_remote_data_source.dart';
import 'package:beer_ranking/domain/models/beer_model.dart';
import 'package:beer_ranking/domain/repositories/beer_repository.dart';
import 'package:beer_ranking/features/add/cubit/add_cubit.dart';
import 'package:beer_ranking/features/auth/pages/user_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCubit(
        BeerRepository(
          BeerRemoteDataSource(),
        ),
      ),
      child: BlocConsumer<AddCubit, AddState>(
        listener: (context, state) {
          if (state.addStatus == AddStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Beer added successfully'),
              ),
            );
            Navigator.of(context).pop();
          } else if (state.addStatus == AddStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Uknown error'),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.addStatus == AddStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text('Add Your Beer'),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const UserProfile(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.person),
                ),
              ],
            ),
            body: const _AddPageBody(),
          );
        },
      ),
    );
  }
}

class _AddPageBody extends StatefulWidget {
  const _AddPageBody();
  @override
  State<_AddPageBody> createState() => _AddPageBodyState();
}

class _AddPageBodyState extends State<_AddPageBody> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _breweryController = TextEditingController();
  final TextEditingController _imageURLController = TextEditingController();
  double _rating = 3.0;
  DateTime? _dateSelector;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Form(
              key: _formKey,
              child: TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Beer',
                  hintText: 'PunkIPA',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _breweryController,
              decoration: const InputDecoration(
                labelText: 'Brewery',
                hintText: 'BrewDog',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            Slider(
              value: _rating,
              min: 0.0,
              max: 6.0,
              divisions: 12,
              label: _rating.toString(),
              onChanged: (value) {
                setState(
                  () {
                    _rating = value;
                  },
                );
              },
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _imageURLController,
              decoration: const InputDecoration(
                labelText: 'Image URL',
                hintText: 'https://....jpg',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: _dateSelector ?? DateTime.now(),
                  firstDate: DateTime(1990),
                  lastDate: DateTime(2030),
                );
                if (picked != null && picked != _dateSelector) {
                  setState(
                    () {
                      _dateSelector = picked;
                    },
                  );
                }
              },
              child: Text(
                _dateSelector == null
                    ? 'Choose date'
                    : DateFormat.yMMMEd().format(_dateSelector!),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  DateTime dateSelected = _dateSelector ?? DateTime.now();
                  final beer = BeerModel(
                      name: _nameController.text,
                      brewery: _breweryController.text,
                      rating: _rating,
                      date: dateSelected,
                      imageURL: _imageURLController.text,
                      id: '');

                  context.read<AddCubit>().addItem(beer);
                }
              },
              child: const Text('Add Your Beer'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:beer_ranking/app/core/enums.dart';
import 'package:beer_ranking/domain/models/beer_model.dart';
import 'package:beer_ranking/domain/repositories/beer_repository.dart';
import 'package:beer_ranking/features/add/cubit/add_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockBeerRepository extends Mock implements BeerRepository {}

class FakeBeerModel extends Fake implements BeerModel {}

void main() {
  late AddCubit sut;
  late MockBeerRepository repository;

  setUpAll(() {
    registerFallbackValue(FakeBeerModel());
  });

  setUp(() {
    repository = MockBeerRepository();
    sut = AddCubit(beerRepository: repository);
  });

  group('addItem', () {
    final beer = BeerModel(
      name: 'TestBeer',
      brewery: 'TestBrewery',
      rating: 3.5,
      date: DateTime.now(),
      imageURL: 'http//:test.com',
      id: 'testID',
    );

    group('success', () {
      blocTest<AddCubit, AddState>(
        'emits Status.loading then Status.success with results',
        build: () => sut,
        act: (cubit) {
          when(() => repository.addItem(any())).thenAnswer((_) async {});
          return cubit.addItem(beer);
        },
        expect: () => [
          const AddState(addStatus: AddStatus.loading),
          const AddState(addStatus: AddStatus.success)
        ],
      );
    });
    group('failure', () {
      blocTest<AddCubit, AddState>(
        'emits Status.loading then Status.error with error message',
        build: () => sut,
        act: (cubit) {
          const errorMessage = 'Failed to add item';
          when(() => repository.addItem(any()))
              .thenThrow(Exception(errorMessage));
          return cubit.addItem(beer);
        },
        expect: () => [
          const AddState(addStatus: AddStatus.loading),
          const AddState(
            addStatus: AddStatus.error,
            errorMessage: 'Exception: Failed to add item',
          ),
        ],
      );
    });
  });
}

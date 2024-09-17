import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:client/domain/entities/batchesEntities.dart';

List<Batchesentities> batchs = [
  Batchesentities(
    name: "name",
    data: "${DateTime.now().day} / ${DateTime.now().month}",
    time: "${DateTime.now().hour}",
    phoneNumber: "7856445468",
    email: "iampm@gmail.com",
  ),
  Batchesentities(
    name: "name",
    data: "${DateTime.now().day} / ${DateTime.now().month}",
    time: "${DateTime.now().hour}",
    phoneNumber: "7856445468",
    email: "iampm@gmail.com",
  ),
  Batchesentities(
    name: "name",
    data: "${DateTime.now().day} / ${DateTime.now().month}",
    time: "${DateTime.now().hour}.${DateTime.now().microsecond}",
    phoneNumber: "7856445468",
    email: "iampm@gmail.com",
  ),
];

// Define a class to encapsulate the provider
class BatchProviders {
  static final listBatchesProvider = Provider<List<Batchesentities>>((ref) {
    return batchs;
  });
}

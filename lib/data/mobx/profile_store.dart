import 'package:ems/data/models/Ems_data_model.dart';
import 'package:ems/data/network/repository/home_repository.dart';
import 'package:mobx/mobx.dart';

part 'Profile_store.g.dart';

class ProfileStore = _profileStore with _$ProfileStore;

abstract class _profileStore with Store {
  @observable
  ObservableFuture<EmsDataModel?> date = ObservableFuture.value(null);

  @computed
  bool get isLoading => date.status == FutureStatus.pending;

  @computed
  bool get hasError => date.status == FutureStatus.rejected;

  @computed
  bool get isSuccess => date.status == FutureStatus.fulfilled;

  @action
  Future<void> fetchUser(int id)async{
    date =ObservableFuture(
      HomeRepository.
    )

  }
}

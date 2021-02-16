import 'package:ioasys/filter_redux/state.dart';
import 'package:ioasys/models/auth_credentials.dart';
import 'package:ioasys/models/enterprise_list.dart';
import 'package:ioasys/persistence/data_source.dart';

class EnterprisesRepository implements DataSource<EnterpriseInfoList> {
  final InMemoryDataSource memory;
  final NetworkDataSource network;

  EnterprisesRepository(this.memory, this.network);

  @override
  void combine(String key, EnterpriseInfoList other) {
    memory.combine(key, other);
  }

  bool contains(String key, FilterState filter) {
    if (filter is FilterSelectedState) {
      return memory.containsKey('$key${filter.id}');
    }

    return memory.containsKey(key);
  }

  @override
  bool containsKey(String key) => memory.containsKey(key);

  Future<EnterpriseInfoList> loadFiltered(String key, int id) async {
    final filterKey = '$key$id';

    if (!memory.containsKey(filterKey)) {
      network.setFilter(id);
      memory.combine(filterKey, await network.load(key));
    }

    return memory.load(filterKey);
  }

  @override
  Future<EnterpriseInfoList> load(String key) async {
    if (!memory.containsKey(key)) {
      memory.combine(key, await network.load(key));
    }

    return memory.load(key);
  }

  Future<EnterpriseInfoList> fetch(
      String key, AuthCredentials credentials, FilterState filter) {
    network.setCredentials(credentials);
    network.setFilter(0);

    if (filter is FilterSelectedState) {
      return loadFiltered(key, filter.id);
    }

    return load(key);
  }

  static final instance =
      EnterprisesRepository(InMemoryDataSource(), NetworkDataSource.instance);
}

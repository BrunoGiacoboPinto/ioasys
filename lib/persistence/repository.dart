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

  @override
  bool containsKey(String key) => memory.containsKey(key);

  @override
  Future<EnterpriseInfoList> load(String key) async {
    if (!memory.containsKey(key)) {
      memory.combine(key, await network.load(key));
    }

    return memory.load(key);
  }

  Future<EnterpriseInfoList> fetch(String key, AuthCredentials credentials) {
    network.setCredentials(credentials);
    return load(key);
  }

  static final instance =
      EnterprisesRepository(InMemoryDataSource(), NetworkDataSource.instance);
}

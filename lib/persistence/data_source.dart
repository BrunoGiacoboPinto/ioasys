import 'package:dio/dio.dart';
import 'package:ioasys/api/api_client.dart';
import 'package:ioasys/models/auth_credentials.dart';
import 'package:ioasys/models/enterprise_list.dart';

abstract class DataSource<T> {
  bool containsKey(String key);

  Future<T> load(String key);

  void combine(String key, T other);
}

class InMemoryDataSource implements DataSource<EnterpriseInfoList> {
  final _cache = <String, EnterpriseInfoList>{};

  @override
  Future<EnterpriseInfoList> load(String key) {
    return Future.value(_cache[key]);
  }

  @override
  bool containsKey(String key) => _cache.containsKey(key);

  @override
  void combine(String key, EnterpriseInfoList other) {
    _cache[key] = other;
  }
}

class NetworkDataSource implements DataSource<EnterpriseInfoList> {
  AuthCredentials credentials;
  final EnterpriseApiClient apiClient;

  int filterId = 0;

  NetworkDataSource(this.apiClient, {this.credentials});

  void setFilter(int id) {
    this.filterId = id;
  }

  void setCredentials(AuthCredentials other) {
    this.credentials = AuthCredentials((b) => b
      ..accessToken = other.accessToken
      ..client = other.client
      ..uid = other.uid);
  }

  @override
  void combine(String key, EnterpriseInfoList other) {}

  @override
  bool containsKey(String key) => false;

  @override
  Future<EnterpriseInfoList> load(String key) {
    final token = credentials.accessToken;
    final client = credentials.client;
    final uid = credentials.uid;

    if (filterId != 0) {
      return apiClient
          .getEnterprisesWithFilter(
              type: filterId,
              name: key,
              uid: uid,
              client: client,
              accessToken: token)
          .then((response) => response.data);
    }

    return apiClient
        .getEnterprisesWithName(
            name: key, uid: uid, client: client, accessToken: token)
        .then((response) => response.data);
  }

  static final instance = NetworkDataSource(EnterpriseApiClient(Dio(BaseOptions(
    headers: {'Content-Type': 'application/json'},
    connectTimeout: 5000,
    receiveTimeout: 5000,
  ))));
}

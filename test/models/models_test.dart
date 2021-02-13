import 'package:flutter_test/flutter_test.dart';
import 'package:ioasys/models/enterprise_info.dart';
import 'package:ioasys/models/enterprise_type.dart';

void main() {
  final enterpriseData = {
    "id": 1,
    "email_enterprise": null,
    "facebook": null,
    "twitter": null,
    "linkedin": null,
    "phone": null,
    "own_enterprise": false,
    "enterprise_name": "Fluoretiq Limited",
    "photo": "/uploads/enterprise/photo/1/240.jpeg",
    "description":
        "FluoretiQ is a Bristol based medtech start-up developing diagnostic technology to enable bacteria identification within the average consultation window, so that patients can get the right anti-biotics from the start.  ",
    "city": "Bristol",
    "country": "UK",
    "value": 0,
    "share_price": 5000,
    "enterprise_type": {"id": 3, "enterprise_type_name": "Health"}
  };

  test('Validate model parse enterprise data properly', () {
    final enterprise = EnterpriseInfo.fromJson(enterpriseData);
    expect(enterprise.own_enterprise, equals(enterpriseData['own_enterprise']));
    expect(enterprise.description, equals(enterpriseData['description']));
    expect(
        enterprise.enterprise_name, equals(enterpriseData['enterprise_name']));
    expect(enterprise.share_price, equals(enterpriseData['share_price']));
    expect(enterprise.facebook, equals(enterpriseData['facebook']));
    expect(enterprise.linkedin, equals(enterpriseData['linkedin']));
    expect(enterprise.twitter, equals(enterpriseData['twitter']));
    expect(enterprise.country, equals(enterpriseData['country']));
    expect(enterprise.phone, equals(enterpriseData['phone']));
    expect(enterprise.photo, equals(enterpriseData['photo']));
    expect(enterprise.value, equals(enterpriseData['value']));
    expect(enterprise.city, equals(enterpriseData['city']));
    expect(enterprise.id, equals(enterpriseData['id']));
    expect(enterprise.email_enterprise,
        equals(enterpriseData['email_enterprise']));

    expect(enterprise.enterprise_type,
        equals(EnterpriseType.from(enterpriseData['enterprise_type']).build()));
  });
}

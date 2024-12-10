import 'package:flutter_test/flutter_test.dart';
import 'package:td/entities/user.dart';

void main() {
  group("User model testing", () {
    test("Should return error when user model not created properly", () {
      final userData = {
        "id": 1,
        "name": "Leanne Graham",
        "username": "Bret",
        "email": "Sincere@april.biz",
        "address": {
          "street": "Kulas Light",
          "suite": "Apt. 556",
          "city": "Gwenborough",
          "zipcode": "92998-3874",
          "geo": {
            "lat": "-37.3159",
            "lng": "81.1496",
          }
        },
        "phone": "1-770-736-8031 x56442",
        "website": "hildegard.org",
        "company": {
          "name": "Romaguera-Crona",
          "catchPhrase": "Multi-layered client-server neural-net",
          "bs": "harness real-time e-markets",
        }
      };

      User user1 = User.fromJson(userData);

      expect(user1.id, 1);
      expect(user1.name, "Leanne Graham");

      expect(user1.runtimeType, User);
    });
  });
}

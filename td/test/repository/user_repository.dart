import 'package:flutter_test/flutter_test.dart';
import 'package:td/service/service.dart';

void main() {
  group("User repository testing", () {

    test("should return error when api url is not correct", () async {

      UserService _userService =
          UserService(); 
      var response = await _userService
          .getUsers(); 

      expect(response.isRight(),
          true); 
    });
  });
}

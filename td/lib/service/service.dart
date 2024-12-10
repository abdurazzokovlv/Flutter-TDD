

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:td/entities/user.dart';

class UserService {
  Future<Either<String, List<User>>> getUsers() async {
    try {
      // Foydalanuvchilarni olish uchun so'rov yuboramiz
      Response response = await Dio().get("https://jsonplaceholder.typicode.com/users");

      // Agar javob muvaffaqiyatli bo'lsa
      if (response.statusCode == 200) {
        // Javobdan foydalanuvchilar ro'yxatini qaytaramiz
        return right((response.data as List)
            .map((e) => User.fromJson(e))


            
            .toList());
      } else {
        // Agar status kodi 200 dan boshqa bo'lsa, xato xabarini qaytaramiz
        return left(response.statusMessage.toString());
      }
    } on DioException catch (e) {
      // Xatolik yuz bersa, xato xabarini qaytaramiz
      return left(e.message.toString());
    }
  }
}

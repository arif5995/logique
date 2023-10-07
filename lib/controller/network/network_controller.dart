import 'package:dio/dio.dart';
import 'package:logique/controller/network/model/post_response_dto.dart';
import 'package:logique/controller/network/model/user_response_dto2.dart';
import 'package:logique/model/post_model.dart';
import 'package:logique/model/user_model.dart';

abstract class NetworkController {
  Future<List<User>> getDataUser({required int page});
  Future<User> getDataUserById({required String idUser});
  Future<List<Post>> getDataPostById({required String idUser});
}

class NetworkControllerImpl implements NetworkController {
  final Dio dio;

  NetworkControllerImpl({required this.dio});

  @override
  Future<List<User>> getDataUser({required int page}) async {
   try{
     final response = await dio.get("https://dummyapi.io/data/v1/user", queryParameters: {
       "page" : page,
       "limit" : 20
     });
     final data = UserResponseDto.fromJson(response.data);
     return data.data!;
   }catch(e){
     rethrow;
   }
  }

  @override
  Future<User> getDataUserById({required String idUser})async {
    try{
      final response = await dio.get("https://dummyapi.io/data/v1/user/$idUser");
      return User.fromJson(response.data);
    }catch(e){
      rethrow;
    }
  }

  @override
  Future<List<Post>> getDataPostById({required String idUser}) async {
    try{
      final response = await dio.get("https://dummyapi.io/data/v1/user/$idUser/post");
      final data = PostResponseDto.fromJson(response.data);
      return data.data!;
    }catch(e){
      rethrow;
    }
  }


}

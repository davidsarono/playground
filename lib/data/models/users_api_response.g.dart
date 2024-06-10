// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersApiResponse _$UsersApiResponseFromJson(Map<String, dynamic> json) =>
    UsersApiResponse(
      page: (json['page'] as num).toInt(),
      perPage: (json['per_page'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      totalPages: (json['total_pages'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => UserItemApi.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UsersApiResponseToJson(UsersApiResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total': instance.total,
      'total_pages': instance.totalPages,
      'data': instance.data,
    };

UserItemApi _$UserItemApiFromJson(Map<String, dynamic> json) => UserItemApi(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      avatar: json['avatar'] as String,
    );

Map<String, dynamic> _$UserItemApiToJson(UserItemApi instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'avatar': instance.avatar,
    };

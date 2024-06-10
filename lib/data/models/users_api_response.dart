import 'package:json_annotation/json_annotation.dart';

part 'users_api_response.g.dart';

@JsonSerializable()
class UsersApiResponse {
    @JsonKey(name: "page")
    final int page;
    @JsonKey(name: "per_page")
    final int perPage;
    @JsonKey(name: "total")
    final int total;
    @JsonKey(name: "total_pages")
    final int totalPages;
    @JsonKey(name: "data")
    final List<UserItemApi> data;

    UsersApiResponse({
        required this.page,
        required this.perPage,
        required this.total,
        required this.totalPages,
        required this.data,
    });

    factory UsersApiResponse.fromJson(Map<String, dynamic> json) => _$UsersApiResponseFromJson(json);

    Map<String, dynamic> toJson() => _$UsersApiResponseToJson(this);
}

@JsonSerializable()
class UserItemApi {
    @JsonKey(name: "id")
    final int id;
    @JsonKey(name: "email")
    final String email;
    @JsonKey(name: "first_name")
    final String firstName;
    @JsonKey(name: "last_name")
    final String lastName;
    @JsonKey(name: "avatar")
    final String avatar;

    UserItemApi({
        required this.id,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.avatar,
    });

    factory UserItemApi.fromJson(Map<String, dynamic> json) => _$UserItemApiFromJson(json);

    Map<String, dynamic> toJson() => _$UserItemApiToJson(this);
}

import '../../../../core/core.dart';
import '../dtos/login_user_dto.dart';

class LoginUserDtoToUserInfoMapper extends BaseMapper<LoginUserDto, UserInfo> {
  @override
  UserInfo call(LoginUserDto obj) {
    return UserInfo(
      accessToken: obj.accessToken,
      refreshToken: obj.refreshToken,
    );
  }
}

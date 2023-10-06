package ak.app.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import ak.app.entity.ak;
import ak.app.entity.userInfo;

@Mapper
public interface mapper {
	public List<ak> Lists();
	public List<userInfo> selectMemberList();
	public int insertMember(userInfo userInfo); // 회원등록(성공이면 1 실패면 0)
	public userInfo registerCheck(String id);
	public int register(userInfo u);
	public userInfo Login(userInfo u);
}

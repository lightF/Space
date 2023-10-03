package ak.app.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import ak.app.entity.회원;

@Mapper
public interface Akmapper {
	public 회원 중복체크(회원 아이디);
	public List<회원> AkLists();
	public void Insert(회원 vo); //회원등록(성공이면 1 실패면 0)
	public int register(회원 아이디);
	public 회원 Login(회원 mvo);
}

package ak.app.entity;

import lombok.Data;

@Data
public class 회원 {
	  private int idx; // 번호
	  private String 소속; // 제목
	  private String 부서; // 내용
	  private String 이름; // 작성자
	  private String 아이디; // 작성일
	  private String 패스워드; // 작성일
	  private String 이메일; // 작성일
	  private int 연락처; // 작성일
}
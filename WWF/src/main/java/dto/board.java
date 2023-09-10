package dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class board {
//6개의 멤버변수
		private int idx;
		private String title;
		private String content;
		private String writer;
		private String indate;
		private int count;
		//setter or getter 메서드 생성
		
}

package batis;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class webpage {
	datavo vo = new datavo();
	@Autowired	//XML에 등록된 bean에 대한 id값을 가져올 때 사용함
	BasicDataSource datasouce;
	//XML에 ID에 이름을 로드하여 해당 SQL 정보를 Class에 전달하게 됨.
	@SuppressWarnings("unused")
	
	@Inject		//XML에 대한 데이터를 가져올 때 사용하는 의존성 주입
	private SqlSessionFactory sqlsessionfactory;
	//@Resource	//@Autowired 확장형
	//private SqlSessionTemplate sqlsession;
	
	//2023-09-26 파일업로드
	/*@PostMapping("/fileupok.do")
	public void fileUpload(@RequestParam MultipartFile[] mfile, HttpServletRequest req,filevo fileVO)throws IOException, InterruptedException {
		String dir = req.getServletContext().getRealPath("/files/");
		//String extension = StringUtils.getFilenameExtension(mfile[0].getOriginalFilename()); 확장자 가져오기
		UUID uuid = null;
		String extension = null;
		String rename = null;
		ArrayList<String> sb = new ArrayList<String>();
			for (int x = 0; x < mfile.length; x++) {
			uuid = UUID.randomUUID();
			extension = "."+StringUtils.getFilenameExtension(mfile[x].getOriginalFilename());
			rename = uuid.toString()+extension;
			Thread.sleep(100);
			FileCopyUtils.copy(mfile[x].getBytes(),new File(dir+rename));
		}
		System.out.println(dir);
		SqlSession se = sqlsessionfactory.openSession();
		int a = se.insert("reviewDB.file_upload","./files/"+sb.toString());
		System.out.println(sb);
		sb.add("./files/"+rename);
		Thread.sleep(1000);
		String dbfilename = String.join(",", sb);
		
		int result = se.insert("reviewDB.file_upload",dbfilename);
		if(a>0) {
			System.out.println("저장");
		}
	}
	*/
	
	
	@PostMapping("/fileupok.do")
	public void fileUpload(@RequestParam MultipartFile[] mfile, HttpServletRequest req) throws IOException, InterruptedException {
	    String dir = req.getServletContext().getRealPath("/files/");
	    List<String> uploadedFileNames = new ArrayList<>();
	    
	    for (MultipartFile file : mfile) {
	        String extension = "." + StringUtils.getFilenameExtension(file.getOriginalFilename());
	        String rename = UUID.randomUUID().toString() + extension;
	        FileCopyUtils.copy(file.getBytes(), new File(dir + rename));
	        uploadedFileNames.add("./files/" + rename);
	    }

	    System.out.println(dir);
	    SqlSession se = sqlsessionfactory.openSession();
	    String dbFileNames = String.join(",", uploadedFileNames);

	    int result = se.insert("reviewDB.file_upload", dbFileNames);
	    
	    if (result > 0) {
	        System.out.println("저장");
	        
	    }
	}
	
	
	
	//리뷰 수정완료 페이지
	@RequestMapping("data_modify.do")
	public void modifyok(@ModelAttribute("review") datavo datavo) throws Exception {
		SqlSession se = sqlsessionfactory.openSession();
		int result = se.update("reviewDB.review_update", datavo);
		if(result > 0) {
			System.out.println("정상적으로 수정완료!!");
		}
		else {
			System.out.println("데이터베이스 문법 오류 발생!!");
		}
		se.close();
	}
	
	//리뷰 수정 전 페이지
	@RequestMapping("review_modify.do")
	public String review_modify(@RequestParam(required = false) String ridx, Model m) {
	    SqlSession se = sqlsessionfactory.openSession();
	    try {
	        /*
	        vo = se.selectOne("reviewDB.selectone", ridx);
	        m.addAttribute("id", vo ..)
	        */
	    	datavo vo = se.selectOne("reviewDB.selectone", ridx);
	        ArrayList<String> onedata = new ArrayList<String>();
	        onedata.add(vo.getRidx());
	        onedata.add(vo.getRname());
	        onedata.add(vo.getRpass());
	        onedata.add(vo.getRtext());
	        onedata.add(vo.getRindate());
	        m.addAttribute("one", onedata);
	    }
	    catch(Exception e) {
	        System.out.println("SQL 문법 오류 발생!!");
	    }
	    finally {
	        se.close();
	    }
	    return "/WEB-INF/jsp/review_view";
	}

	
	
	//리뷰 삭제
	@RequestMapping("review_delete.do")
	public String review_del(HttpServletResponse res, @RequestParam(required = false) String ridx) {
		SqlSession se = sqlsessionfactory.openSession();
	    try {
	        int result = se.delete("review_delete", ridx);
	        
	        if (result > 0) {
	            //System.out.println("리뷰가 성공적으로 삭제되었습니다.");
	            PrintWriter pw = res.getWriter();
	            pw.write("<script> alert('리뷰가 성공적으로 삭제되었습니다'); location.href='./review_list.do'</script>");
	        } else {
	            System.out.println("리뷰 삭제에 실패했습니다.");
	        }
	    }
	    catch(Exception e) {
	        System.out.println("올바른 접근 방식이 아닙니다.");
	    }
	    finally {
	    	se.commit();
	        se.close();
	    }
	    return "redirect:/review_list.do";
	}
	
	@RequestMapping("data_search.do")
	public String data_search(@RequestParam(required = false) String keyword, Model model) {
	    SqlSession se = sqlsessionfactory.openSession();
	    
	    try {
	        List<datavo> dataList = se.selectList("reviewDB.review_search", keyword);
	        int count = dataList.size();
	        
	        model.addAttribute("dataList", dataList);
	        model.addAttribute("count", count);
	    } catch (Exception e) {
	        System.out.println("데이터 검색 오류 발생!!");
	    } finally {
	        se.close();
	    }
	    return "WEB-INF/jsp/review_list";
	}

	
	//리뷰 리스트 출력
	/*
	defaultValue : 숫자형태의 자료형일 때 사용
	required : 문자형태의 자료형일 때 사용
	*/
	@RequestMapping("review_list.do")
	public void review_list(@RequestParam(defaultValue = "0") int ridx, HttpServletRequest req, HttpServletResponse res) {
		try {
			SqlSession se = sqlsessionfactory.openSession();
			String ct = se.selectOne("reviewDB.review_select");
			if(ridx < 2) {
				ridx = 0;
			}
			else {
				//공식 : 현재 페이지 / 페이징의 갯수 * 페이징의 갯수 + 1
				int ctint = Integer.parseInt(ct);
				ridx = ((ridx - 1) * 2); 	//2번 누르면 2,2 3=> 4,2 4=>6,2가 되어야 함.
				System.out.println(ridx);
			}
			List<datavo> data = se.selectList("reviewDB.selectall", ridx);
			
			req.setAttribute("ct", ct);
			req.setAttribute("data", data);
			RequestDispatcher ds = req.getRequestDispatcher("/WEB-INF/jsp/review_list.jsp");
			ds.forward(req, res);
			se.close();
		}
		catch(Exception e) {
			System.out.println("Database 접속 오류 발생!!");
		}
	}
	
	
	
	
	
	//해당 페이지에 데이터 갯수가 출력되도록 MYbatis를 사용해보자
	
	//selectList : 해당 데이터를 범위 안에서 모두 가져올 때
	//selectOne : 하나의 데이터만 가져올 때
	
	@RequestMapping("data_select.do")
	public String data_select(Model m) {
		SqlSession se = sqlsessionfactory.openSession();
		
		List<datavo> dataList = se.selectList("reviewDB.review_select");
	    int count = dataList.size();
		m.addAttribute("count", count);
		System.out.println("데이터 갯수: " + count);
		
		return "WEB-INF/jsp/data_select";
	}
	
	
	
	//@ModelAttribute : parameter, method형태를 구성하게 된다. vo, dto 형태로 구성이 원칙
	//해당 name값을 vo나 dto에 동일하게 셋팅을 하며, Database Field명과 동일할 경우,
	//요청한 값을 모두 db에 저장시킬 수 있음.
	
	/*
	 @ModelAttribute(별명 명칭) - 1개 이상 사용 시
	*/
	
	@RequestMapping("data_insert.do")
	public String data_insert(@ModelAttribute("review") datavo datavo) throws Exception {
		SqlSession se = sqlsessionfactory.openSession();
		
		int a = se.insert("reviewDB.review_insert", datavo);
		if(a > 0) {
			System.out.println("정상적으로 리뷰가 등록되었습니다.");
		}
		else {
			System.out.println("SQL 문법 오류 발생!!");
		}
		return "/WEB-INF/jsp/login";
	}
	
	@RequestMapping("login.do")
	public String logins() {	//BasicDataSource만 사용
		try {
			Connection con = datasouce.getConnection();
			String sql = "select count(*) as cnt from air_reserse";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			String result = rs.getString("cnt");
			System.out.println(result);
			rs.close();
			ps.close();
			con.close();
		}
		catch(Exception e) {
			System.out.println("Database 접속 오류!!");
		}
		return "/WEB-INF/jsp/login";
	}
}

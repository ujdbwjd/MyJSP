package com.kb.org;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kb.org.member.MemberVO;

@WebServlet("*.do")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MainController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd = null; //jsp 파일지정
		
		request.setCharacterEncoding("UTF-8");
		String reqURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = reqURI.substring(contextPath.length());
		
		System.out.println("reqURI = " + reqURI);
		System.out.println("contextPath = " + contextPath);
		System.out.println("cmd = " + cmd);
		
		
//    	tomcat 서버실행 시
//    	server.xml
//    	web.xml
//    	context.xml
//    	어노테이션
		
		if(cmd.equals("/index.do")) {
			/*
			 * 최신 회원가입한 목록 5개 select
			 * 최신 글 목록 5개 select
			 * List 2개
			 */
			rd = request.getRequestDispatcher("index.jsp");
		} else if(cmd.equals("/member.do")) {
			
			//db연결
			try {
				
				Connection conn = ConnectionPool.getConnection(); //context.xml에 db연결
				PreparedStatement pstmt = conn.prepareStatement("select * from member");
				ResultSet rs = pstmt.executeQuery();
				
				List<MemberVO> list = new ArrayList<>();
				
				while(rs.next()) {
					list.add(new MemberVO(
							rs.getInt("seq"),
							rs.getString("id"),
							rs.getString("name"),
							rs.getString("pwd"),
							rs.getString("gender"),
							rs.getString("joindate")
						)
					);
				}
				
				request.setAttribute("list", list);
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			rd = request.getRequestDispatcher("member.jsp");
			
		} else if(cmd.equals("/freeboard.do")) { 
			rd = request.getRequestDispatcher("freeboard.jsp");
		} else if(cmd.equals("/memberInsert.do")) { 
			rd = request.getRequestDispatcher("memberInsert.jsp");
		} else if(cmd.equals("/memberInsertPro.do")) { 
			// 회원 등록 후 list 화면 출력
			
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String pwd = request.getParameter("pwd");
			String gender = request.getParameter("gender");
			
			try {
				
				Connection conn = ConnectionPool.getConnection();
				PreparedStatement pstmt = conn.prepareStatement("insert into member (id, name, pwd, gender) values (?,?,?,?)");
				pstmt.setString(1, id);
				pstmt.setString(2, name);
				pstmt.setString(3, pwd);
				pstmt.setString(4, gender);
				pstmt.executeUpdate();
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			System.out.println("정상적으로 저장");
			
			rd = request.getRequestDispatcher("member.jsp");
		}

		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

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

import com.kb.org.member.MemberDAO;
import com.kb.org.member.MemberVO;

@WebServlet("*.do")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberDAO md = MemberDAO.getInstance();

    public MainController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd = null; //jsp 파일지정
		
		request.setCharacterEncoding("UTF-8");
		String reqURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = reqURI.substring(contextPath.length());

		if(cmd.equals("/index.do")) {
			rd = request.getRequestDispatcher("index.jsp");
			
		} else if(cmd.equals("/member.do")) {
			md.select(request);
			md.cntmember(request);
			rd = request.getRequestDispatcher("member.jsp");
			
		} else if(cmd.equals("/freeboard.do")) { 
			rd = request.getRequestDispatcher("freeboard.jsp");
			
		} else if(cmd.equals("/memberInsert.do")) { 
			rd = request.getRequestDispatcher("memberInsert.jsp");
			
		} else if(cmd.equals("/memberInsertPro.do")) { 
			md.insert(request);
			md.select(request);
			md.cntmember(request);
			rd = request.getRequestDispatcher("member.jsp");
			
		}
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
